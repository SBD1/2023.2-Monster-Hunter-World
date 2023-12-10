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
def routeListaPersonagem():
    conn=wait_for_db()
    pcList=read_all_pcs(conn)
    app.logger.info(pcList)
    conn.close()
    return pageListaPersonagem(pcList)


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
        cria_inventario(conn,pcId)
        conn.close()
        return redirect("/tutorial/"+str(pcId))
    else:
       return pageCriarPersonagem() 
    
@app.route('/tutorial/<int:pcId>')
def routeTutorial(pcId):
    nome = get_nome_player(wait_for_db(), pcId)
    npcNome = get_nome_npc(wait_for_db(), 1)
    mapaNome = get_nome_mapa(wait_for_db(), 1)
    regiaoAtualNome = get_nome_regiao(wait_for_db(), 9)
    possivelRegiaoNome = get_nome_regiao(wait_for_db(), 7)
    outraPossivelRegiaoNome = get_nome_regiao(wait_for_db(), 8)
    return pageTutorial(nome, pcId, npcNome, mapaNome, regiaoAtualNome, possivelRegiaoNome, outraPossivelRegiaoNome)

@app.route('/movimentacao/<int:pcId>')
def movimentacao(pcId):
    update_regiao_PC(wait_for_db(), pcId, 7)
    return pageMovimentacao(pcId)

@app.route('/retornaAreaEncontro/<int:pcId>')
def retornaAreaEncontro(pcId):
    update_regiao_PC(wait_for_db(), pcId, 9)
    return pageAreaEncontro(pcId)

@app.route('/regiao/<int:pcId>')
def routeRegiao(pcId):
    regiao =read_regiao_PC(wait_for_db(),pcId)
    leva_em = read_leva_em(wait_for_db(), regiao.id_regiao)
    return pageRegiao(regiao,leva_em, pcId)

@app.route('/atualizaPCRegiao/<int:pcId>/<int:regiaoId>')
def atualizaPCRegiao(pcId,regiaoId):
    update_regiao_PC(wait_for_db(), pcId, regiaoId)
    return redirect("/regiao/"+str(pcId))

@app.route('/retornaLoja/<int:pcId>')
def retornaLoja(pcId):
    din = get_dinheiro_player(wait_for_db(), pcId)
    return pageLoja(din, pcId)

@app.route('/retornaForja/<int:pcId>')
def retornaForja(pcId):
    nomeFerreiro = get_nome_ferreiro(wait_for_db())
    return pageForja(nomeFerreiro, pcId)

@app.route('/retornaForjarEquipamento/<int:pcId>')
def retornaForjarEquipamento(pcId):
    falaFerreiro = get_fala_ferreiro(wait_for_db())
    return pageForjarEquipamento(falaFerreiro, pcId)

@app.route('/retornaForjarArmas/<int:pcId>')
def retornaForjarArmas(pcId):
    armas = get_nome_armas(wait_for_db())
    din = get_dinheiro_player(wait_for_db(), pcId)
    return pageForjarArmas(din, pcId, armas)

@app.route('/retornaForjarArmaduras/<int:pcId>')
def retornaForjarArmaduras(pcId):
    armaduras = get_nome_armaduras(wait_for_db())
    din = get_dinheiro_player(wait_for_db(), pcId)
    return pageForjarArmaduras(din, pcId, armaduras)

@app.route('/forjaArma/<int:pcId>/<int:armaId>/<int:custo>/<int:ataque>')
def forjaArma(pcId, armaId, custo, ataque):
    dinheiro = get_dinheiro_player(wait_for_db(), pcId)
    if dinheiro is not None and dinheiro >= custo:
        update_dinheiro_player(wait_for_db(), pcId, dinheiro - custo)
        insert_guarda_equipamento(wait_for_db(), get_inventario(wait_for_db(), pcId), armaId)
        update_afinidade_player(wait_for_db(), pcId, get_afinidade_player(wait_for_db(), pcId) + ataque)
        return redirect("/sucesso/"+str(pcId))
    else:
        return redirect("/erroNaCompra/"+str(pcId))
    
@app.route('/forjaArmadura/<int:pcId>/<int:armaduraId>/<int:custo>/<int:defesa>')
def forjaArmadura(pcId, armaduraId, custo, defesa):
    dinheiro = get_dinheiro_player(wait_for_db(), pcId)
    if dinheiro is not None and dinheiro >= custo:
        update_dinheiro_player(wait_for_db(), pcId, dinheiro - custo)
        insert_guarda_equipamento(wait_for_db(), get_inventario(wait_for_db(), pcId), armaduraId)
        update_vida_player(wait_for_db(), pcId, get_vida_player(wait_for_db(), pcId) + defesa)
        return redirect("/sucesso/"+str(pcId))
    else:
        return redirect("/erroNaCompra/"+str(pcId))

@app.route('/assistente/<int:pcId>-<int:npcId>')
def routeAssistente(pcId,npcId):
    npc=read_npc(wait_for_db(),npcId)
    falas=read_falas_npc(wait_for_db(),npcId)
    missoes=read_missao_player(wait_for_db(),pcId)
    return pageAssistente(pcId,npc,falas,missoes)


@app.route('/missao/<int:pcId>-<int:npcId>-<int:missaoId>')
def routeMissao(pcId,npcId,missaoId):
    missao=read_missao(wait_for_db(),missaoId)
    mapa=read_mapa(wait_for_db(),missao.mapa)
    return pageMissao(pcId,npcId,missao,mapa)


@app.route('/pegaMissao/<int:pcId>-<int:missaoId>')
def routePegaMissao(pcId,missaoId):
    create_realiza_missao(wait_for_db(),pcId,missaoId)
    return redirect("/regiao/"+str(pcId))


@app.route('/lojaVendeArmas/<int:pcId>')
def lojaVendeArmas(pcId):
    armas = get_nome_armas(wait_for_db())
    return pageLojaVendeArmas(pcId, armas)

@app.route('/lojaVendeAmuletos/<int:pcId>')
def lojaVendeAmuletos(pcId):
    amuletos = get_nome_amuletos(wait_for_db())
    return pageLojaVendeAmuletos(pcId, amuletos)

@app.route('/lojaVendeFerramentas/<int:pcId>')
def lojaVendeFerramentas(pcId):
    Ferramentas = get_nome_Ferramentas(wait_for_db())
    return pageLojaVendeFerramentas(pcId, Ferramentas)

@app.route('/erroNaCompra/<int:pcId>')
def erroNaCompra(pcId):
    return pageErroNaCompra(pcId)

@app.route('/sucesso/<int:pcId>')
def sucesso(pcId):
    return pageSucessoNaCompra(pcId)

@app.route('/compraArma/<int:pcId>/<int:armaId>/<int:custo>/<int:ataque>')
def compraArma(pcId,armaId, custo, ataque):
    dinheiro = get_dinheiro_player(wait_for_db(), pcId)
    if dinheiro is not None and dinheiro >= custo:
        update_dinheiro_player(wait_for_db(), pcId, dinheiro-custo)
        insert_guarda_equipamento(wait_for_db(), get_inventario(wait_for_db(), pcId), armaId)
        update_afinidade_player(wait_for_db(), pcId, get_afinidade_player(wait_for_db(), pcId)+ataque)
        return redirect("/sucesso/"+str(pcId))
    else:
        return redirect("/erroNaCompra/"+str(pcId))
    
@app.route('/compraAmuleto/<int:pcId>/<int:AmuletoId>/<int:custo>/<int:melhoria>')
def compraAmuleto(pcId,AmuletoId, custo, melhoria):
    dinheiro = get_dinheiro_player(wait_for_db(), pcId)
    if dinheiro is not None and dinheiro >= custo:
        update_dinheiro_player(wait_for_db(), pcId, dinheiro-custo)
        insert_guarda_equipamento(wait_for_db(), get_inventario(wait_for_db(), pcId), AmuletoId)
        update_vida_player(wait_for_db(), pcId, get_vida_player(wait_for_db(), pcId)+melhoria)
        return redirect("/sucesso/"+str(pcId))
    else:
        return redirect("/erroNaCompra/"+str(pcId))

@app.route('/compraFerramenta/<int:pcId>/<int:FerramentaId>/<int:custo>/<int:raridade>')
def compraFerramenta(pcId,FerramentaId, custo, raridade):
    dinheiro = get_dinheiro_player(wait_for_db(), pcId)
    if dinheiro is not None and dinheiro >= custo:
        update_dinheiro_player(wait_for_db(), pcId, dinheiro-custo)
        insert_guarda_equipamento(wait_for_db(), get_inventario(wait_for_db(), pcId), FerramentaId)
        update_ranque_player(wait_for_db(), pcId, get_ranque_player(wait_for_db(), pcId)+raridade)
        return redirect("/sucesso/"+str(pcId))
    else:
        return redirect("/erroNaCompra/"+str(pcId))
    
if __name__ == "__main__":
    app.run(debug=True)
