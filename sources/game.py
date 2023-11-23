import os
import time
import psycopg2
from dotenv import load_dotenv

from sources.controller import controller_module

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

def welcome_message():
    print("Bem-vindo ao Monster Hunter World!")
    print("Escolha uma opção:")
    print("1. Criar Personagem")
    print("2. Carregar Personagem")
    print("3. Sair")

def create_character(conn):
    regiao_padrao = "Área de Encontro"
    ranque_padrao = "Iniciante"
    vida_padrao = 100
    vigor_padrao = 100
    afinidade_padrao = 0
    dinheiro_padrao = 0
    
    nome = input("Digite o nome do seu personagem: ")
    genero = input("Digite o gênero do seu personagem: ")
    cor_pele = input("Digite a cor da pele do seu personagem: ")
    cor_cabelo = input("Digite a cor do cabelo do seu personagem: ")
    cor_olho = input("Digite a cor do olho do seu personagem: ")
    tipo_cabelo = input("Digite o tipo de cabelo do seu personagem: ")
    tipo_olho = input("Digite o tipo de olho do seu personagem: ")

    pc_data = {
        'regiao': regiao_padrao,
        'nome': nome,
        'ranque': ranque_padrao,
        'vida': vida_padrao,
        'vigor': vigor_padrao,
        'afinidade': afinidade_padrao,
        'dinheiro': dinheiro_padrao,
        'genero': genero,
        'cor_pele': cor_pele,
        'cor_cabelo': cor_cabelo,
        'cor_olho': cor_olho,
        'tipo_cabelo': tipo_cabelo,
        'tipo_olho': tipo_olho
    }

    player_id = controller_module.create_pc(conn, pc_data)

    if player_id is not None:
        print(f"Personagem criado com sucesso! ID: {player_id}")

        # Comandante
        print("\n*** Bem-vindo, Caçador, ao emocionante mundo de Monster Hunter World! ***")
        print("Você está na majestosa Área de Encontro. Vamos falar com o Comandante.")
        input("Pressione Enter para continuar...")

        print("\nComandante: Salve, nobre Caçador! Eu sou o Comandante, líder dos Caçadores desta terra.")
        print("Comandante: Em meio às sombras da natureza, criaturas colossais dominam o nosso mundo.")
        print("Comandante: Como um Caçador, sua missão é desbravar essas terras, caçar monstros poderosos e trazer paz à nossa civilização.")
        print("Comandante: Prepare-se, pois grandes desafios aguardam aqueles que se aventuram nos recantos selvagens de Monster Hunter World!")
        input("Pressione Enter para continuar...")
        print("\nComandante: Agora vá até o Centro de Recursos para receber sua primeira missão.")
        input("Pressione Enter para continuar...")

    else:
        print("Erro ao criar personagem.")


def load_character():
    # nada ainda
    pass

if __name__ == "__main__":
    try:
        db_connection = wait_for_db()
        print("Conexão com o banco de dados estabelecida com sucesso.")
        execute_sql_file('sql_scripts/DDL.sql', db_connection)
        print("Comandos DDL.sql executados com sucesso.")

        while True:
            welcome_message()
            choice = input("Escolha uma opção (1, 2, 3): ")

            if choice == '1':
                create_character(db_connection)
            elif choice == '2':
                load_character()
            elif choice == '3':
                print("Saindo. Até logo!")
                break
            else:
                print("Opção inválida. Tente novamente.")

    except Exception as e:
        print(f"Erro: {e}")
    finally:
        if 'db_connection' in locals():
            db_connection.close()
