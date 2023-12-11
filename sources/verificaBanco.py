import psycopg2
from psycopg2 import sql

# Substitua essas informações de conexão pelos valores do seu banco de dados
conexao_info = {
    'host': 'localhost',
    'dbname': 'MonsterHunter',
    'user': 'postgres',
    'password': '123456',
    'port':'5432'
}

# Itens para a consulta
itens_para_consulta = ['Osso Antigo', 'Presas de Anjanath', 'Pelagem de Anjanath', 'Escama de Anjanath', 'Bilhete de Apreciação', 'Bolsa de Água', 'Chifre Azul', 'Gema Estelar Azul', 'Garra de Barnos', 'Carapaça de Barroth', 'Moeda de Barroth', 'Crista de Barroth', 'Escalpo de Barroth', 'Carapaça de Barroth', 'Carapaça de Bazelgeuse', 'Fusível de Bazelgeuse', 'Osso de Behemoth', 'Crina de Behemoth', 'Cauda de Behemoth', 'Bilhete da Florada', 'Osso L', 'Osso S', 'Osso de Pedra', 'Osso Brutal', 'Minério de Carbalite', 'Bolsa de Coma', 'Bilhete da Comissão', 'Osso Coral', 'Cristal Coral', 'Carapaça de Daora', 'Pele de Deviljho', 'Saliva de Deviljho', 'Escama de Deviljho', 'Carapaça de Diablos', 'Presas de Diablos', 'Crista de Diablos', 'Carapaça de Diablos', 'Caixa da Cauda de Diablos', 'Mandíbula de Dodogama', 'Sangue de Dragão', 'Osso de Dragão', 'Minério de Dragonite', 'Cristal Vein Dragon', 'Cristal Terroso', 'Bolsa de Elétrico', 'Lama Fértil', 'Pedra de Célula de Fogo', 'Moeda Voadora', 'Bolsa Congelante', 'Bolsa Gélida', 'Minério de Fucium', 'Whisker de Gajau', 'Moeda Gama', 'Carapaça de Gastodon', 'Chifre de Gastodon', 'Pele de Girros', 'Capuz de Girros', 'Cauda de Girros', 'Glimstone Dourado', 'Escama Dourada', 'Concha Dourada', 'Casco Caudal Dourado', 'Mosca de Chifre Grande', 'Bilhete da Colheita', 'Carapaça de Hazak', 'Membrana de Hazak', 'Asa de Hazak', 'Escala de Calor', 'Alta Recomendação', 'Carapaça de Hornetaur', 'Asa Interna de Hornetaur', 'Concha de Hornetaur', 'Asa de Hornetaur', 'Moeda do Caçador', 'Escama de Dragão Imortal', 'Bolsa de Inferno', 'Minério de Ferro', 'Pele de Jagras', 'Crina de Jagras', 'Escama de Jagras', 'Carapaça de Jyuratodus', 'Escama de Jyuratodus', 'Carapaça de Jyuratodus', 'Pelagem de Kadachi', 'Escama de Kadachi', 'Escalpo de Kestodon', 'Carapaça de Kestodon', 'Moeda Real', 'Pele de Kirin', 'Crina de Kirin', 'Cauda de Kirin', 'Chifre Trovão de Kirin', 'Bico de Ku', 'Garra de Ku', 'Pele de Ku', 'Moeda Kulu', 'Carapaça de Lavasioth', 'Pele de Legiana', 'Placa de Legiana', 'Escama de Legiana', 'Carapaça de Lunastra', 'Crina de Lunastra', 'Minério de Machalite', 'Carapaça de Magdaros', 'Magma de Magdaros', 'Crista de Magdaros', 'Caldo de Monstro', 'Fluido de Monstro', 'Osso Duro de Monstro', 'Osso Afiado de Monstro', 'Carapaça de Nergigante', 'Garra de Odogaron', 'Presas de Odogaron', 'Gema de Odogaron', 'Placa de Odogaron', 'Corda de Odogaron', 'Bolsa de Omniplegia', 'Pelagem de Paolumu', 'Escama de Paolumu', 'Carapaça de Paolumu', 'Garra Perfurante', 'Moeda do Pico', 'Bolsa de Veneno', 'Carapaça de Pukei', 'Moeda Pukei', 'Bolsa de Pukei', 'Carapaça de Pukei', 'Cauda de Pukei', 'Asa de Pukei', 'Osso de Qualidade', 'Carapaça de Radobaan', 'Casca de Óleo de Radobaan', 'Escama de Radobaan', 'Garra de Rathalos', 'Carapaça de Rathalos', 'Medula de Rathalos', 'Escama de Rathalos', 'Carapaça de Rathalos', 'Cauda de Rathalos', 'Membrana de Rathalos', 'Asa de Rathalos', 'Carapaça de Rathian', 'Córtex de Rathian', 'Placa de Rathian', 'Escama de Rathian', 'Fragmento de Rathian', 'Carapaça de Rathian', 'Espinho de Cauda de Rathian', 'Orbe Vermelho', 'Placa de Regeneração', 'Pele de Shamos', 'Garra Afiada', 'Pano Sinistro', 'Bolsa de Sono', 'Moeda Estelar', 'Osso Robusto', 'Carapaça de Teostra', 'Gema de Teostra', 'Crina de Teostra', 'Bilhete de Teostra', 'Bolsa de Trovão', 'Bolsa de Torrente', 'Carapaça de Uragaan', 'Medula de Uragaan', 'Carapaça de Vespoid', 'Asa Interna de Vespoid', 'Concha de Vespoid', 'Osso Distorcido', 'Cristal do Deserto', 'Pele de Wingdrake', 'Massa Óssea de Wyvern', 'Gema de Wyvern', 'Carapaça de Jiiva', 'Cauda de Jiiva', 'Asa de Jiiva', 'Pele de Qualidade']


try:
    # Conectar ao banco de dados
    conexao = psycopg2.connect(**conexao_info)

    # Criar um cursor para executar comandos SQL
    cursor = conexao.cursor()

    for nome_do_item in itens_para_consulta:
        # Executar a consulta usando SQL parametrizado para evitar injeção de SQL
        consulta = sql.SQL("SELECT * FROM ITEM WHERE NOME LIKE {}").format(sql.Literal(f'%{nome_do_item}%'))
        cursor.execute(consulta)

        # Recuperar os resultados
        resultados = cursor.fetchall()

        # Verificar se há resultados e imprimir
        if resultados:
            print(f"Resultados para o item '{nome_do_item}':")
            for resultado in resultados:
                print(resultado)
        else:
            print(f"O item '{nome_do_item}' não foi encontrado no banco de dados.")

except psycopg2.Error as e:
    print(f"Erro ao conectar ao banco de dados: {e}")

finally:
    # Fechar o cursor e a conexão, mesmo se ocorrer um erro
    if cursor:
        cursor.close()
    if conexao:
        conexao.close()
