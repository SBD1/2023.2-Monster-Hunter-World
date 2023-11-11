import os
import psycopg2
import time
from dotenv import load_dotenv

load_dotenv()


db_username = os.getenv('DB_USERNAME')
db_password = os.getenv('DB_PASSWORD')
db_host = os.getenv('DB_HOST')
db_port = os.getenv('DB_PORT')
db_name = os.getenv('DB_NAME')

def execute_sql_file(filename):
    with open(filename, 'r') as file:
        sql_commands = file.read().split(';')

        sql_commands = [cmd.strip() for cmd in sql_commands if cmd.strip()]

        with psycopg2.connect(
            dbname=db_name,
            user=db_username,
            password=db_password,
            host=db_host,
            port=db_port
        ) as connection:
            with connection.cursor() as cursor:
                for cmd in sql_commands:
                    cursor.execute(cmd)
                connection.commit()

def wait_for_db():
    max_retries = 10
    retry_interval = 5 
    print(db_host,db_name,db_password,db_port)

    for attempt in range(1, max_retries + 1):
        try:
            with psycopg2.connect(
                dbname=db_name,
                user=db_username,
                password=db_password,
                host=db_host,
                port=db_port
            ) as connection:
                break
        except psycopg2.OperationalError:
            print(f"Tentativa {attempt} de {max_retries}: Conexão com o banco de dados falhou. Tentando novamente em {retry_interval} segundos.")
            time.sleep(retry_interval)
    else:
        raise Exception(f"Não foi possível estabelecer conexão com o banco de dados após {max_retries} tentativas.")


wait_for_db()
# Execute os comandos DDL.sql para criar as tabelas
execute_sql_file('DDL.sql')