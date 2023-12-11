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
        sql_commands = file.read()
        cursor= connection.cursor()
        cursor.execute(sql_commands)
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
    execute_sql_file('sql_scripts/Triggers-e-Stored-Procedures.sql', db_connection)
    app.logger.info("Comandos Triggers-e-Stored-Procedures.sql executados com sucesso.")
    if(read_all_mapas(db_connection)==[]):
        execute_sql_file('sql_scripts/DML.sql', db_connection)
        app.logger.info("Comandos DML.sql executados com sucesso.")
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
        regiao=1
        ranque=1
        vida=1000
        vidaAtual=1000
        vigor=500
        afinidade=0
        dinheiro=100
        status=0
        nivel=1
        pc=PC(-1, regiao, nome, ranque, vida,vidaAtual, vigor, afinidade, dinheiro, genero)
        conn=wait_for_db()
        pcId=int(create_pc(conn,pc))
        adicionaItemAoInventario(conn,arma,pcId)
        amigato=Amigato(-1,regiao, pcId, nome_amigato, nivel, status, vida)
        create_amigato(conn,amigato)
        cria_inventario(conn,pcId)
        conn.close()
        npc= read_npc_function(wait_for_db(), "tutorial")
        return redirect("/tutorial/"+str(pcId)+"-"+str(npc.id_npc)+"?firstTime=true")
    else:
       return pageCriarPersonagem() 
    
@app.route('/tutorial/<int:pcId>-<int:npcId>')
def routeTutorial(pcId,npcId):
    firstTime = request.args.get('firstTime')
    nome = get_nome_player(wait_for_db(), pcId)
    npc= read_npc(wait_for_db(),npcId)
    regiao=read_regiao(wait_for_db(),npc.regiao)
    falas=read_falas_npc(wait_for_db(),npc.id_npc)
    return pageTutorial(npc, pcId,regiao,falas,firstTime)

@app.route('/regiao/<int:pcId>')
def routeRegiao(pcId):
    regiao =read_regiao_PC(wait_for_db(),pcId)
    npcs=read_npc_regiao(wait_for_db(),regiao.id_regiao)
    monstros=read_monstro_regiao(wait_for_db(),regiao.id_regiao)
    missao=read_missao_ativa(wait_for_db(),pcId)
    if(missao):
        missoes=obter_dados_missoes(wait_for_db(),missao.id_missao,pcId)
    else:
        missoes=[]
    leva_em=read_leva_em(wait_for_db(),regiao.id_regiao)
    return pageRegiao(regiao,leva_em, npcs, monstros, pcId,missoes)

@app.route('/monstros/<int:pcId>-<int:monstroId>')
def routeMonstro(pcId,monstroId):
    pc=read_pc(wait_for_db(),pcId)
    monstro=read_monstro(wait_for_db(),monstroId)
    instancia_monstro=read_instancia_monstro(wait_for_db(),monstroId)
    return pageMonstro(monstro,instancia_monstro,pc)

@app.route('/atacaMonstro/<int:pcId>-<int:monstroId>-<int:instanciaId>')
def routeAtacaMonstro(pcId,monstroId,instanciaId):
    ataque=atacaInstanciaMonstro(wait_for_db(),pcId,instanciaId)
    if(ataque):
        return redirect("/monstros/"+str(pcId)+"-"+str(monstroId))
    else:
        return redirect("/regiao/"+str(pcId))


@app.route('/atualizaPCRegiao/<int:pcId>-<int:regiaoId>')
def atualizaPCRegiao(pcId,regiaoId):
    update_regiao_PC(wait_for_db(), pcId, regiaoId)
    return redirect("/regiao/"+str(pcId))

@app.route('/assistente/<int:pcId>-<int:npcId>')
def routeAssistente(pcId,npcId):
    npc=read_npc(wait_for_db(),npcId)
    falas=read_falas_npc(wait_for_db(),npcId)
    missoes=read_missao_player(wait_for_db(),pcId)
    return pageAssistente(pcId,npc,falas,missoes)

@app.route('/AssistenteMissao/<int:pcId>-<int:npcId>')
def routeAssistenteMissao(pcId,npcId):
    npc=read_npc(wait_for_db(),npcId)
    falas=read_falas_npc(wait_for_db(),npcId)
    missao=read_missao_ativa(wait_for_db(),pcId)
    return pageAssistenteMissao(pcId,npc,falas,missao)

@app.route('/cancelaMissao/<int:pcId>-<int:missaoId>')
def routeCancelaMissao(pcId,missaoId):
    cancela_missao(wait_for_db(),pcId,missaoId)
    update_regiao_PC(wait_for_db(), pcId, 1)
    return redirect("/regiao/"+str(pcId))

@app.route('/missao/<int:pcId>-<int:npcId>-<int:missaoId>')
def routeMissao(pcId,npcId,missaoId):
    missao=read_missao(wait_for_db(),missaoId)
    mapa=read_mapa(wait_for_db(),missao.mapa)
    return pageMissao(pcId,npcId,missao,mapa)

@app.route('/pegaMissao/<int:pcId>-<int:missaoId>')
def routePegaMissao(pcId,missaoId):
    create_realiza_missao(wait_for_db(),pcId,missaoId)
    return redirect("/regiao/"+str(pcId))

@app.route('/loja/<int:pcId>-<int:npcId>')
def retornaLoja(pcId,npcId):
    din = get_dinheiro_player(wait_for_db(), pcId)
    lojas=read_npc_lojas(wait_for_db(),npcId)
    return pageLoja(din, pcId,npcId,lojas)

@app.route('/loja/<int:pcId>-<int:npcId>-<int:lojaId>')
def retornaLojaItens(pcId,npcId,lojaId):
    din = get_dinheiro_player(wait_for_db(), pcId)
    itens=obter_itens_da_loja(wait_for_db(),lojaId)
    return pageLojaItens(din, pcId,npcId,itens)

@app.route('/forja/<int:pcId>-<int:npcId>')
def retornaForja(pcId,npcId):
    nomeFerreiro = read_npc(wait_for_db(),npcId).nome
    return pageForja(nomeFerreiro, pcId, npcId)

@app.route('/forjarArmas/<int:pcId>-<int:npcId>')
def retornaForjarArmas(pcId,npcId):
    armas = read_all_armas_forja(wait_for_db())
    return pageForjarArmas(armas, pcId, npcId)

@app.route('/forjarArmaduras/<int:pcId>-<int:npcId>')
def retornaForjarArmaduras(pcId,npcId):
    armaduras = read_all_armaduras_forja(wait_for_db())
    return pageForjarArmaduras(armaduras, pcId, npcId)

@app.route('/forja/item/<int:pcId>-<int:npcId>-<int:itemId>')
def routeForjaItem(pcId,npcId,itemId):
    item = read_item(wait_for_db(),itemId)
    itens= obterItensConsumidos(wait_for_db(),itemId)
    return pageForjaItem(item, pcId, npcId,itens)

@app.route('/loja/item/<int:pcId>-<int:npcId>-<int:itemId>')
def routeLojaItem(pcId,npcId,itemId):
    item = read_item(wait_for_db(),itemId)
    return pageLojaItem(item, pcId, npcId)
    
@app.route('/erroNaCompra/<int:pcId>-<int:npcId>')
def erroNaCompra(pcId,npcId):
    return pageErroNaCompra(pcId,npcId)

@app.route('/sucessoNaCompra/<int:pcId>-<int:npcId>')
def sucesso(pcId,npcId):
    return pageSucessoNaCompra(pcId,npcId)

@app.route('/erroNaForja/<int:pcId>-<int:npcId>')
def erroNaForja(pcId,npcId):
    return pageErroNaForja(pcId,npcId)

@app.route('/sucessoNaForja/<int:pcId>-<int:npcId>')
def sucessoForja(pcId,npcId):
    return pageSucessoNaForja(pcId,npcId)

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

    

if __name__ == "__main__":
    app.run(debug=True)
