import os
import psycopg2
from dotenv import load_dotenv
import time
from flask import Flask, render_template, request, redirect
from view import *
from model import *
from controller import *

load_dotenv()


db_username = os.getenv('DB_USERNAME')
db_password = os.getenv('DB_PASSWORD')
db_host = os.getenv('DB_HOST')
db_port = os.getenv('DB_PORT')
db_name = os.getenv('DB_NAME')

app = Flask(__name__)



def execute_sql_file(filename, connection):
    with open(filename, 'r') as file:
        sql_commands = file.read().split(';')
        sql_commands = [cmd.strip() for cmd in sql_commands if cmd.strip()]

        with connection.cursor() as cursor:
            for cmd in sql_commands:
                cursor.execute(cmd)
            connection.commit()


def wait_for_db():
    max_retries = 10
    retry_interval = 5

    for attempt in range(1, max_retries + 1):
        try:
            with psycopg2.connect(
                dbname=db_name,
                user=db_username,
                password=db_password,
                host=db_host,
                port=db_port
            ) as connection:
                return connection
        except psycopg2.OperationalError:
            app.logger.info(f"Tentativa {attempt} de {max_retries}: Conexão com o banco de dados falhou. Tentando novamente em {retry_interval} segundos.")
            time.sleep(retry_interval)
    else:
        raise Exception(f"Não foi possível estabelecer conexão com o banco de dados após {max_retries} tentativas.")


try:
    db_connection = wait_for_db()
    app.logger.info("Conexão com o banco de dados estabelecida com sucesso.")
    execute_sql_file('sql_scripts/DDL.sql', db_connection)
    app.logger.info("Comandos DDL.sql executados com sucesso.")
    if(read_all_mapas(db_connection)==[]):
        execute_sql_file('sql_scripts/DML.sql', db_connection)
        app.logger.info("Comandos DML.sql executados com sucesso.")
        execute_sql_file('sql_scripts/Triggers-e-Stored-Procedures.sql', db_connection)
        app.logger.info("Comandos Triggers-e-Stored-Procedures.sql executados com sucesso.")
except Exception as e:
    app.logger.info(f"Erro: {e}")
finally:
    if 'db_connection' in locals():
        db_connection.close()




@app.route('/')
def index():
    page={
        "name":"Trabalho de SBD1 - 2023.2",
        "background":"mainBackground.jpg",
        "content":[
            {
                "type":"input",
                "text":"Nome:",
                "name":"name"           
            },
            {
                "type":"number",
                "text":"Quantidade:",
                "name":"quantity"           
            },
            {
                "type":"text",
                "text":"Texto de teste",        
            },
            {
                "type":"color",
                "text":"Cor do Cabelo:",
                "name":"HairColor"           
            },
            {
                "type":"button",
                "text":"Confirmar",
                "action":"criarPersonagem"           
            },
            {
                "type":"options",
                "text":"Genero:",    
                "options":[
                    {
                        "text":"Masculino",
                        "value":"masculino"
                    },
                    {
                        "text":"Feminino",
                        "value":"feminino"
                    }
                ]
            },
        ]
    }
    return render_template('index.html',page=page)

@app.route('/criarPersonagem')
def routeCriaPersonagem():   
    nome = request.args.get('nome')
    arma = request.args.get('arma')
    genero = request.args.get('genero')
    nome_amigato = request.args.get('amigato')

    if nome and arma and genero and nome_amigato:
        regiao=7
        ranque=1
        vida=100
        vigor=30
        afinidade=0
        dinheiro=0
        status=0
        nivel=1
        pc=PC(-1, regiao, nome, ranque, vida, vigor, afinidade, dinheiro, genero)
        conn=wait_for_db()
        pcId=int(create_pc(conn,pc))
        amigato=Amigato(-1,regiao, pcId, nome_amigato, nivel, status, vida)
        create_amigato(conn,amigato)
        conn.close()
        return routeTutorial(pcId=pcId)
    else:
       return pageCriarPersonagem() 

@app.route('/listaPersonagem')
def routeListaPersonagem():
    conn=wait_for_db()
    pcList=read_all_pcs(conn)
    app.logger.info(pcList)
    conn.close()
    return pageListaPersonagem(pcList)

@app.route('/usuario/<int:user_id>/<string:user_name>')
def mostrar_usuario(user_id, user_name):
    return f'ID do usuario: {user_id}, Nome do usuario: {user_name}'

@app.route('/usuario', methods=['GET'])
def mostrar_usuario_body():
    data = request.get_json()
    user_id = data.get('id', None)
    user_name = data.get('nome', None)

    if user_id is not None and user_name is not None:
        return jsonify({'mensagem': f'ID do usuário: {user_id}, Nome do usuário: {user_name}'})
    else:
        return jsonify({'erro': 'Parâmetros inválidos'}), 400
    
@app.route('/tutorial')
def routeTutorial(pcId):
    return pageTutorial(pcId)

@app.route('/movimentacao/<int:pcId>')
def movimentacao(pcId):
    return pageMovimentacao(pcId)

@app.route('/retornaCentroRecursos/<int:pcId>')
def retornaCentroRecursos(pcId):
    update_regiao_PC(wait_for_db(), pcId, 8)
    return pageCentroRecursos(pcId)

@app.route('/retornaAreaEncontro/<int:pcId>')
def retornaAreaEncontro(pcId):
    update_regiao_PC(wait_for_db(), pcId, 9)
    return pageAreaEncontro(pcId)

@app.route('/retornaLoja/<int:pcId>')
def retornaLoja(pcId):
    din = get_dinheiro_player(wait_for_db(), pcId)
    return pageLoja(din, pcId)






try:
    db_connection = wait_for_db()
    print("Conexão com o banco de dados estabelecida com sucesso.")
    execute_sql_file('sql_scripts/DDL.sql', db_connection)
    print("Comandos DDL.sql executados com sucesso.")
except Exception as e:
    print(f"Erro: {e}")
finally:
    if 'db_connection' in locals():
        db_connection.close()
        
if __name__ == "__main__":
    app.run(debug=True)
