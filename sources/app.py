import os
import psycopg2
from dotenv import load_dotenv
import time
from flask import Flask, render_template, request
from view import *

load_dotenv()


db_username = os.getenv('DB_USERNAME')
db_password = os.getenv('DB_PASSWORD')
db_host = os.getenv('DB_HOST')
db_port = os.getenv('DB_PORT')
db_name = os.getenv('DB_NAME')


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
            print(f"Tentativa {attempt} de {max_retries}: Conexão com o banco de dados falhou. Tentando novamente em {retry_interval} segundos.")
            time.sleep(retry_interval)
    else:
        raise Exception(f"Não foi possível estabelecer conexão com o banco de dados após {max_retries} tentativas.")


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



app = Flask(__name__)


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
        ]
    }
    return render_template('index.html',page=page)

@app.route('/criarPersonagem')
def routeCriaPersonagem():
    return pageCriarPersonagem()

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
def routeTutorial():
    return pageTutorial()

if __name__ == "__main__":
    app.run(debug=True)
