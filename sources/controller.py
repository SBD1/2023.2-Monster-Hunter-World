from model import *
import random


def create_mapa(conn, mapa):
    try:
        cursor = conn.cursor()
        cursor.execute("INSERT INTO Mapa (Nome, Descricao) VALUES (%s, %s) RETURNING IdMapa;", (mapa.nome, mapa.descricao))
        id_mapa = cursor.fetchone()[0]
        conn.commit()
        cursor.close()
        return id_mapa
    except Exception as e:
        conn.rollback()
        print(f"Erro ao criar mapa: {e}")
        return None

def read_mapa(conn, id_mapa):
    try:
        cursor = conn.cursor()
        cursor.execute("SELECT * FROM Mapa WHERE IdMapa = %s;", (id_mapa,))
        result = cursor.fetchone()
        cursor.close()
        if result:
            mapa = Mapa(*result)
            return mapa
        else:
            print("Mapa não encontrado.")
            return None
    except Exception as e:
        print(f"Erro ao ler mapa: {e}")
        return None

def read_all_mapas(conn):
    try:
        cursor = conn.cursor()
        cursor.execute("SELECT * FROM Mapa;")
        results = cursor.fetchall()
        cursor.close()
        mapas = [Mapa(*result) for result in results]
        return mapas
    except Exception as e:
        print(f"Erro ao ler todos os mapas: {e}")
        return None

def read_last_mapa(conn):
    try:
        cursor = conn.cursor()
        cursor.execute("SELECT * FROM Mapa ORDER BY IdMapa DESC LIMIT 1;")
        result = cursor.fetchone()
        cursor.close()
        if result:
            mapa = Mapa(*result)
            return mapa
        else:
            print("Nenhum mapa encontrado.")
            return None
    except Exception as e:
        print(f"Erro ao ler último mapa: {e}")
        return None

def update_mapa(conn, mapa):
    try:
        cursor = conn.cursor()
        cursor.execute("UPDATE Mapa SET Nome = %s, Descricao = %s WHERE IdMapa = %s;", (mapa.nome, mapa.descricao, mapa.id_mapa))
        conn.commit()
        cursor.close()
        print("Mapa atualizado com sucesso.")
    except Exception as e:
        conn.rollback()
        print(f"Erro ao atualizar mapa: {e}")

def delete_mapa(conn, id_mapa):
    try:
        cursor = conn.cursor()
        cursor.execute("DELETE FROM Mapa WHERE IdMapa = %s;", (id_mapa,))
        conn.commit()
        cursor.close()
        print("Mapa excluído com sucesso.")
    except Exception as e:
        conn.rollback()
        print(f"Erro ao excluir mapa: {e}")

def create_regiao(conn, regiao):
    try:
        cursor = conn.cursor()
        cursor.execute("INSERT INTO Regiao (Nome, Descricao, IdMapa) VALUES (%s, %s, %s) RETURNING IdRegiao;",
                       (regiao.nome, regiao.descricao, regiao.id_mapa))
        id_regiao = cursor.fetchone()[0]
        conn.commit()
        cursor.close()
        return id_regiao
    except Exception as e:
        conn.rollback()
        print(f"Erro ao criar região: {e}")
        return None

def read_regiao(conn, id_regiao):
    try:
        cursor = conn.cursor()
        cursor.execute("SELECT * FROM Regiao WHERE IdRegiao = %s;", (id_regiao,))
        result = cursor.fetchone()
        cursor.close()
        if result:
            regiao = Regiao(*result)
            return regiao
        else:
            print("Região não encontrada.")
            return None
    except Exception as e:
        print(f"Erro ao ler região: {e}")
        return None

def read_all_regioes(conn):
    try:
        cursor = conn.cursor()
        cursor.execute("SELECT * FROM Regiao;")
        results = cursor.fetchall()
        cursor.close()
        regioes = [Regiao(*result) for result in results]
        return regioes
    except Exception as e:
        print(f"Erro ao ler todas as regiões: {e}")
        return None

def update_regiao(conn, regiao):
    try:
        cursor = conn.cursor()
        cursor.execute("UPDATE Regiao SET Nome = %s, Descricao = %s, IdMapa = %s WHERE IdRegiao = %s;",
                       (regiao.nome, regiao.descricao, regiao.id_mapa, regiao.id_regiao))
        conn.commit()
        cursor.close()
        print("Região atualizada com sucesso.")
    except Exception as e:
        conn.rollback()
        print(f"Erro ao atualizar região: {e}")

def delete_regiao(conn, id_regiao):
    try:
        cursor = conn.cursor()
        cursor.execute("DELETE FROM Regiao WHERE IdRegiao = %s;", (id_regiao,))
        conn.commit()
        cursor.close()
        print("Região excluída com sucesso.")
    except Exception as e:
        conn.rollback()
        print(f"Erro ao excluir região: {e}")

def create_leva_em(conn, leva_em):
    try:
        cursor = conn.cursor()
        cursor.execute("INSERT INTO LevaEm (RegiaoOrigem, RegiaoDestino) VALUES (%s, %s);",
                       (leva_em.regiao_origem, leva_em.regiao_destino))
        conn.commit()
        cursor.close()
        print("Relacionamento LevaEm criado com sucesso.")
    except Exception as e:
        conn.rollback()
        print(f"Erro ao criar relacionamento LevaEm: {e}")

        

def read_leva_em(conn, regiao_origem):
    try:
        cursor = conn.cursor()
        cursor.execute("SELECT Regiao.* FROM LevaEm INNER JOIN Regiao ON LevaEm.RegiaoDestino = Regiao.IdRegiao WHERE LevaEm.RegiaoOrigem = %s"%(regiao_origem))
        result = cursor.fetchall()
        cursor.close()
        if result:
            regiao_list = [Regiao(*row) for row in result]
            return regiao_list
        else:
            print("Relacionamento LevaEm não encontrado.")
            return []
    except Exception as e:
        print(f"Erro ao ler relacionamento LevaEm: {e}")

    

def read_all_leva_em(conn):
    try:
        cursor = conn.cursor()
        cursor.execute("SELECT * FROM LevaEm;")
        results = cursor.fetchall()
        cursor.close()
        leva_em_list = [LevaEm(*result) for result in results]
        return leva_em_list
    except Exception as e:
        print(f"Erro ao ler todos os relacionamentos LevaEm: {e}")
        return None

def update_leva_em(conn, leva_em):
    try:
        cursor = conn.cursor()
        cursor.execute("UPDATE LevaEm SET RegiaoOrigem = %s, RegiaoDestino = %s WHERE IdLevaEm = %s;",
                       (leva_em.regiao_origem, leva_em.regiao_destino, leva_em.id_leva_em))
        conn.commit()
        cursor.close()
        print("Relacionamento LevaEm atualizado com sucesso.")
    except Exception as e:
        conn.rollback()
        print(f"Erro ao atualizar relacionamento LevaEm: {e}")

def delete_leva_em(conn, id_leva_em):
    try:
        cursor = conn.cursor()
        cursor.execute("DELETE FROM LevaEm WHERE IdLevaEm = %s;", (id_leva_em,))
        conn.commit()
        cursor.close()
        print("Relacionamento LevaEm excluído com sucesso.")
    except Exception as e:
        conn.rollback()
        print(f"Erro ao excluir relacionamento LevaEm: {e}")

def create_npc(conn, npc):
    try:
        cursor = conn.cursor()
        cursor.execute("INSERT INTO NPC (Regiao, Nome, Descricao, Funcao, Raca, Genero) VALUES (%s, %s, %s, %s, %s, %s) RETURNING IdNPC;",
                       (npc.regiao, npc.nome, npc.descricao, npc.funcao, npc.raca, npc.genero))
        id_npc = cursor.fetchone()[0]
        conn.commit()
        cursor.close()
        return id_npc
    except Exception as e:
        conn.rollback()
        print(f"Erro ao criar NPC: {e}")
        return None

def read_npc(conn, id_npc):
    try:
        cursor = conn.cursor()
        cursor.execute("SELECT * FROM NPC WHERE IdNPC = %s;", (id_npc,))
        result = cursor.fetchone()
        cursor.close()
        if result:
            npc = NPC(*result)
            return npc
        else:
            print("NPC não encontrado.")
            return None
    except Exception as e:
        print(f"Erro ao ler NPC: {e}")
        return None

def read_npc_function(conn, function):
    try:
        cursor = conn.cursor()
        cursor.execute("SELECT * FROM NPC WHERE Funcao = '%s' ORDER BY IdNPC;"%(function))
        result = cursor.fetchone()
        cursor.close()
        if result:
            npc = NPC(*result)
            return npc
        else:
            print("NPC não encontrado.")
            return None
    except Exception as e:
        print(f"Erro ao ler NPC: {e}")
        return None

def read_all_npcs(conn):
    try:
        cursor = conn.cursor()
        cursor.execute("SELECT * FROM NPC;")
        results = cursor.fetchall()
        cursor.close()
        npcs = [NPC(*result) for result in results]
        return npcs
    except Exception as e:
        print(f"Erro ao ler todos os NPCs: {e}")
        return None

def read_npc_regiao(conn, id_regiao):
    try:
        cursor = conn.cursor()
        cursor.execute("SELECT * FROM NPC WHERE Regiao = %s;", (id_regiao,))
        result = cursor.fetchall()
        cursor.close()
        if result:
            regiao_list = [NPC(*row) for row in result]
            return regiao_list
        else:
            print("NPCs não encontrados.")
            return []
    except Exception as e:
        print(f"Erro ao ler NPC: {e}")
        return None

def update_npc(conn, npc):
    try:
        cursor = conn.cursor()
        cursor.execute("UPDATE NPC SET Regiao = %s, Nome = %s, Descricao = %s, Funcao = %s, Raca = %s, Genero = %s WHERE IdNPC = %s;",
                       (npc.regiao, npc.nome, npc.descricao, npc.funcao, npc.raca, npc.genero, npc.id_npc))
        conn.commit()
        cursor.close()
        print("NPC atualizado com sucesso.")
    except Exception as e:
        conn.rollback()
        print(f"Erro ao atualizar NPC: {e}")

def delete_npc(conn, id_npc):
    try:
        cursor = conn.cursor()
        cursor.execute("DELETE FROM NPC WHERE IdNPC = %s;", (id_npc,))
        conn.commit()
        cursor.close()
        print("NPC excluído com sucesso.")
    except Exception as e:
        conn.rollback()
        print(f"Erro ao excluir NPC: {e}")

def create_pc(conn, pc):
    cursor = conn.cursor()
    cursor.execute("INSERT INTO PC (Regiao, Nome, Ranque, Vida, VidaAtual, Vigor, Afinidade, Dinheiro, Genero) "
                    "VALUES (%s, %s, %s,%s, %s, %s, %s, %s, %s) RETURNING IdPlayer;",
                    (pc.regiao, pc.nome, pc.ranque, pc.vida, pc.vidaAtual, pc.vigor, pc.afinidade, pc.dinheiro, pc.genero))
    id_player = cursor.fetchone()[0]
    conn.commit()
    cursor.close()
    return id_player

def read_pc(conn, id_player):
    try:
        cursor = conn.cursor()
        cursor.execute("SELECT * FROM PC WHERE IdPlayer = %s;", (id_player,))
        result = cursor.fetchone()
        cursor.close()
        if result:
            pc = PC(*result)
            return pc
        else:
            print("PC não encontrado.")
            return None
    except Exception as e:
        print(f"Erro ao ler PC: {e}")
        return None

def read_all_pcs(conn):
    try:
        cursor = conn.cursor()
        cursor.execute("SELECT * FROM PC;")
        results = cursor.fetchall()
        cursor.close()
        pcs = [PC(*result) for result in results]
        return pcs
    except Exception as e:
        print(f"Erro ao ler todos os PCs: {e}")
        return None

def update_pc(conn, pc):
    try:
        cursor = conn.cursor()
        cursor.execute("UPDATE PC SET Regiao = %s, Nome = %s, Ranque = %s, Vida = %s, Vigor = %s, Afinidade = %s, Dinheiro = %s, Genero = %s, "
                       "CorPele = %s, CorCabelo = %s, CorOlho = %s, TipoCabelo = %s, TipoOlho = %s WHERE IdPlayer = %s;",
                       (pc.regiao, pc.nome, pc.ranque, pc.vida, pc.vigor, pc.afinidade, pc.dinheiro, pc.genero, pc.cor_pele, pc.cor_cabelo, pc.cor_olho, pc.tipo_cabelo, pc.tipo_olho, pc.id_player))
        conn.commit()
        cursor.close()
        print("PC atualizado com sucesso.")
    except Exception as e:
        conn.rollback()
        print(f"Erro ao atualizar PC: {e}")

def delete_pc(conn, id_player):
    try:
        cursor = conn.cursor()
        cursor.execute("DELETE FROM PC WHERE IdPlayer = %s;", (id_player,))
        conn.commit()
        cursor.close()
        print("PC excluído com sucesso.")
    except Exception as e:
        conn.rollback()
        print(f"Erro ao excluir PC: {e}")

def adiciona_arma_pc(conn,id_player,arma):
    try:
        cursor = conn.cursor()
        cursor.execute("CALL AdicionaItemParaPlayer('%s',%s);", (arma,id_player,))
        conn.commit()
        cursor.close()
    except Exception as e:
        conn.rollback()
        print(f"Erro ao adicionar arma para o PC: {e}")

def create_amigato(conn, amigato):
    try:
        cursor = conn.cursor()
        cursor.execute("INSERT INTO Amigato (Regiao, PC, Nome, Nivel, Status, Vida) VALUES (%s, %s, %s, %s, %s, %s) RETURNING IdAmigato;",
                       (amigato.regiao, amigato.pc, amigato.nome, amigato.nivel, amigato.status, amigato.vida))
        id_amigato = cursor.fetchone()[0]
        conn.commit()
        cursor.close()
        return id_amigato
    except Exception as e:
        conn.rollback()
        print(f"Erro ao criar Amigato: {e}")
        return None

def read_amigato(conn, id_amigato):
    try:
        cursor = conn.cursor()
        cursor.execute("SELECT * FROM Amigato WHERE IdAmigato = %s;", (id_amigato,))
        result = cursor.fetchone()
        cursor.close()
        if result:
            amigato = Amigato(*result)
            return amigato
        else:
            print("Amigato não encontrado.")
            return None
    except Exception as e:
        print(f"Erro ao ler Amigato: {e}")
        return None

def read_all_amigatos(conn):
    try:
        cursor = conn.cursor()
        cursor.execute("SELECT * FROM Amigato;")
        results = cursor.fetchall()
        cursor.close()
        amigatos = [Amigato(*result) for result in results]
        return amigatos
    except Exception as e:
        print(f"Erro ao ler todos os Amigatos: {e}")
        return None

def update_amigato(conn, amigato):
    try:
        cursor = conn.cursor()
        cursor.execute("UPDATE Amigato SET Regiao = %s, PC = %s, Nome = %s, Nivel = %s, Status = %s, Vida = %s WHERE IdAmigato = %s;",
                       (amigato.regiao, amigato.pc, amigato.nome, amigato.nivel, amigato.status, amigato.vida, amigato.id_amigato))
        conn.commit()
        cursor.close()
        print("Amigato atualizado com sucesso.")
    except Exception as e:
        conn.rollback()
        print(f"Erro ao atualizar Amigato: {e}")

def delete_amigato(conn, id_amigato):
    try:
        cursor = conn.cursor()
        cursor.execute("DELETE FROM Amigato WHERE IdAmigato = %s;", (id_amigato,))
        conn.commit()
        cursor.close()
        print("Amigato excluído com sucesso.")
    except Exception as e:
        conn.rollback()
        print(f"Erro ao excluir Amigato: {e}")

def create_fala(conn, fala):
    try:
        cursor = conn.cursor()
        cursor.execute("INSERT INTO Fala (NPC, Fala, Repetivel) VALUES (%s, %s, %s) RETURNING IdFala;",
                       (fala.npc, fala.fala, fala.repetivel))
        id_fala = cursor.fetchone()[0]
        conn.commit()
        cursor.close()
        return id_fala
    except Exception as e:
        conn.rollback()
        print(f"Erro ao criar Fala: {e}")
        return None

def read_fala(conn, id_fala):
    try:
        cursor = conn.cursor()
        cursor.execute("SELECT * FROM Fala WHERE IdFala = %s;", (id_fala,))
        result = cursor.fetchone()
        cursor.close()
        if result:
            fala = Fala(*result)
            return fala
        else:
            print("Fala não encontrada.")
            return None
    except Exception as e:
        print(f"Erro ao ler Fala: {e}")
        return None

def read_all_falas(conn):
    try:
        cursor = conn.cursor()
        cursor.execute("SELECT * FROM Fala;")
        results = cursor.fetchall()
        cursor.close()
        falas = [Fala(*result) for result in results]
        return falas
    except Exception as e:
        print(f"Erro ao ler todas as Falas: {e}")
        return None

def read_falas_npc(conn,id_npc):
    cursor = conn.cursor()
    cursor.execute("""  SELECT * 
                        FROM Fala
                        WHERE NPC=%s
                        ORDER BY IdFala;
                        """%(id_npc))
    results = cursor.fetchall()
    falas = [Fala(*result) for result in results]
    cursor.close()
    conn.commit()
    return falas


def update_fala(conn, fala):
    try:
        cursor = conn.cursor()
        cursor.execute("UPDATE Fala SET NPC = %s, Fala = %s, Repetivel = %s WHERE IdFala = %s;",
                       (fala.npc, fala.fala, fala.repetivel, fala.id_fala))
        conn.commit()
        cursor.close()
        print("Fala atualizada com sucesso.")
    except Exception as e:
        conn.rollback()
        print(f"Erro ao atualizar Fala: {e}")

def delete_fala(conn, id_fala):
    try:
        cursor = conn.cursor()
        cursor.execute("DELETE FROM Fala WHERE IdFala = %s;", (id_fala,))
        conn.commit()
        cursor.close()
        print("Fala excluída com sucesso.")
    except Exception as e:
        conn.rollback()
        print(f"Erro ao excluir Fala: {e}")

def create_fala_prereq(conn, fala_prereq):
    try:
        cursor = conn.cursor()
        cursor.execute("INSERT INTO FalaPreReq (FalaPrereq, Fala) VALUES (%s, %s) RETURNING IdFalaPrereq;",
                       (fala_prereq.fala_prereq, fala_prereq.fala))
        id_fala_prereq = cursor.fetchone()[0]
        conn.commit()
        cursor.close()
        return id_fala_prereq
    except Exception as e:
        conn.rollback()
        print(f"Erro ao criar FalaPreReq: {e}")
        return None

def read_fala_prereq(conn, id_fala_prereq):
    try:
        cursor = conn.cursor()
        cursor.execute("SELECT * FROM FalaPreReq WHERE IdFalaPrereq = %s;", (id_fala_prereq,))
        result = cursor.fetchone()
        cursor.close()
        if result:
            fala_prereq = FalaPreReq(*result)
            return fala_prereq
        else:
            print("FalaPrereq não encontrada.")
            return None
    except Exception as e:
        print(f"Erro ao ler FalaPrereq: {e}")
        return None


def read_all_falas_prereq(conn):
    try:
        cursor = conn.cursor()
        cursor.execute("SELECT * FROM FalaPreReq;")
        results = cursor.fetchall()
        cursor.close()
        falas_prereq = [FalaPreReq(*result) for result in results]
        return falas_prereq
    except Exception as e:
        print(f"Erro ao ler todas as FalasPrereq: {e}")
        return None

def update_fala_prereq(conn, fala_prereq):
    try:
        cursor = conn.cursor()
        cursor.execute("UPDATE FalaPreReq SET FalaPrereq = %s, Fala = %s WHERE IdFalaPrereq = %s;",
                       (fala_prereq.fala_prereq, fala_prereq.fala, fala_prereq.id_fala_prereq))
        conn.commit()
        cursor.close()
        print("FalaPrereq atualizada com sucesso.")
    except Exception as e:
        conn.rollback()
        print(f"Erro ao atualizar FalaPrereq: {e}")

def delete_fala_prereq(conn, id_fala_prereq):
    try:
        cursor = conn.cursor()
        cursor.execute("DELETE FROM FalaPreReq WHERE IdFalaPrereq = %s;", (id_fala_prereq,))
        conn.commit()
        cursor.close()
        print("FalaPrereq excluída com sucesso.")
    except Exception as e:
        conn.rollback()
        print(f"Erro ao excluir FalaPrereq: {e}")

def create_monstro(conn, monstro):
    try:
        cursor = conn.cursor()
        cursor.execute("INSERT INTO Monstro (Nome, Elemento, AtacaMonstros, AlcanceHostilidade, Tipo) VALUES (%s, %s, %s, %s, %s) RETURNING IdMonstro;",
                       (monstro.nome, monstro.elemento, monstro.ataca_monstros, monstro.alcance_hostilidade, monstro.tipo))
        id_monstro = cursor.fetchone()[0]
        conn.commit()
        cursor.close()
        return id_monstro
    except Exception as e:
        conn.rollback()
        print(f"Erro ao criar Monstro: {e}")
        return None

def read_monstro(conn, id_monstro):
    try:
        cursor = conn.cursor()
        cursor.execute("SELECT * FROM Monstro WHERE IdMonstro = %s;", (id_monstro,))
        result = cursor.fetchone()
        cursor.close()
        if result:
            monstro = Monstro(*result)
            return monstro
        else:
            print("Monstro não encontrado.")
            return None
    except Exception as e:
        print(f"Erro ao ler Monstro: {e}")
        return None

def read_all_monstros(conn):
    try:
        cursor = conn.cursor()
        cursor.execute("SELECT * FROM Monstro;")
        results = cursor.fetchall()
        cursor.close()
        monstros = [Monstro(*result) for result in results]
        return monstros
    except Exception as e:
        print(f"Erro ao ler todos os Monstros: {e}")
        return None

def update_monstro(conn, monstro):
    try:
        cursor = conn.cursor()
        cursor.execute("UPDATE Monstro SET Nome = %s, Elemento = %s, AtacaMonstros = %s, AlcanceHostilidade = %s, Tipo = %s WHERE IdMonstro = %s;",
                       (monstro.nome, monstro.elemento, monstro.ataca_monstros, monstro.alcance_hostilidade, monstro.tipo, monstro.id_monstro))
        conn.commit()
        cursor.close()
        print("Monstro atualizado com sucesso.")
    except Exception as e:
        conn.rollback()
        print(f"Erro ao atualizar Monstro: {e}")

def delete_monstro(conn, id_monstro):
    try:
        cursor = conn.cursor()
        cursor.execute("DELETE FROM Monstro WHERE IdMonstro = %s;", (id_monstro,))
        conn.commit()
        cursor.close()
        print("Monstro excluído com sucesso.")
    except Exception as e:
        conn.rollback()
        print(f"Erro ao excluir Monstro: {e}")

def create_instancia_monstro(conn, instancia_monstro):
    try:
        cursor = conn.cursor()
        cursor.execute("INSERT INTO InstanciaMonstro (Monstro, Status, Vida, Tamanho, Nivel, Ataque) VALUES (%s, %s, %s, %s, %s, %s) RETURNING IdInstanciaMonstro;",
                       (instancia_monstro.monstro, instancia_monstro.status, instancia_monstro.vida, instancia_monstro.tamanho, instancia_monstro.nivel, instancia_monstro.ataque))
        id_instancia_monstro = cursor.fetchone()[0]
        conn.commit()
        cursor.close()
        return id_instancia_monstro
    except Exception as e:
        conn.rollback()
        print(f"Erro ao criar InstanciaMonstro: {e}")
        return None

def read_instancia_monstro(conn, id_monstro):
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM InstanciaMonstro WHERE Status=1 AND Monstro=%s;", (id_monstro,))
    result = cursor.fetchone()
    if not result:
        cursor.execute("""INSERT INTO InstanciaMonstro (Monstro, Status, Vida)
                        SELECT
                            IdMonstro,
                            1,
                            Vida
                        FROM Monstro
                        WHERE IdMonstro =%s;"""%(id_monstro))
        conn.commit()
        cursor.execute("SELECT * FROM InstanciaMonstro WHERE Status=1 AND Monstro=%s;", (id_monstro,))
        result = cursor.fetchone()
    cursor.close()
    if result:
        instancia_monstro = InstanciaMonstro(*result)
        return instancia_monstro
    else:
        print("InstanciaMonstro não encontrada.")
        return None

def read_all_instancias_monstro(conn):
    try:
        cursor = conn.cursor()
        cursor.execute("SELECT * FROM InstanciaMonstro;")
        results = cursor.fetchall()
        cursor.close()
        instancias_monstro = [InstanciaMonstro(*result) for result in results]
        return instancias_monstro
    except Exception as e:
        print(f"Erro ao ler todas as InstanciasMonstro: {e}")
        return None


def atacaInstanciaMonstro(conn, player, instancia_monstro):
    # Criar um cursor
    cursor = conn.cursor()

    # Realizar o SELECT
    select_query = """
        SELECT SUM(A.Ataque) AS SomaAtaques
        FROM UtilizaItem UI
        JOIN Arma A ON UI.Item = A.IdArma
        WHERE UI.PC = %s;
    """

    cursor.execute(select_query, (player,))

    # Obter o resultado do SELECT
    resultado = cursor.fetchone()

    if resultado:
        soma_ataques = resultado[0]
        print(f"Soma dos ataques: {soma_ataques}")

        # Subtrair da vida da instância do monstro
        update_query = """
            UPDATE InstanciaMonstro
            SET Vida = Vida - %s
            WHERE IdInstanciaMonstro = %s;
        """

        insert_ataca_query = """
            INSERT INTO AtacaMonstro (PC, Monstro, Dano)
            VALUES (%s, %s, %s);
        """

        cursor.execute(update_query, (soma_ataques, instancia_monstro))
        cursor.execute(insert_ataca_query, (player, instancia_monstro,player))

        update_query = """
            UPDATE InstanciaMonstro
            SET Status = 0
            WHERE Vida <= 0;
        """
        cursor.execute(update_query)
        conn.commit()

        cursor.execute("SELECT Status FROM InstanciaMonstro WHERE IdInstanciaMonstro = %s"%(instancia_monstro))
        
        resultado = cursor.fetchone()[0]
        print("Vida da instância do monstro atualizada.")
        cursor.close()
        return(resultado)
    else:
        print("Nenhum ataque disponível para o jogador.")    

def update_instancia_monstro(conn, instancia_monstro):
    try:
        cursor = conn.cursor()
        cursor.execute("UPDATE InstanciaMonstro SET Monstro = %s, Status = %s, Vida = %s, Tamanho = %s, Nivel = %s, Ataque = %s WHERE IdInstanciaMonstro = %s;",
                       (instancia_monstro.monstro, instancia_monstro.status, instancia_monstro.vida, instancia_monstro.tamanho, instancia_monstro.nivel, instancia_monstro.ataque, instancia_monstro.id_instancia_monstro))
        conn.commit()
        cursor.close()
        print("InstanciaMonstro atualizada com sucesso.")
    except Exception as e:
        conn.rollback()
        print(f"Erro ao atualizar InstanciaMonstro: {e}")

def delete_instancia_monstro(conn, id_instancia_monstro):
    try:
        cursor = conn.cursor()
        cursor.execute("DELETE FROM InstanciaMonstro WHERE IdInstanciaMonstro = %s;", (id_instancia_monstro,))
        conn.commit()
        cursor.close()
        print("InstanciaMonstro excluída com sucesso.")
    except Exception as e:
        conn.rollback()
        print(f"Erro ao excluir InstanciaMonstro: {e}")

def create_regiao_monstro(conn, regiao_monstro):
    try:
        cursor = conn.cursor()
        cursor.execute("INSERT INTO RegiaoMonstro (Regiao, Monstro) VALUES (%s, %s) RETURNING IdRegiaoMonstro;",
                       (regiao_monstro.regiao, regiao_monstro.monstro))
        id_regiao_monstro = cursor.fetchone()[0]
        conn.commit()
        cursor.close()
        return id_regiao_monstro
    except Exception as e:
        conn.rollback()
        print(f"Erro ao criar RegiaoMonstro: {e}")
        return None

def read_regiao_monstro(conn, id_regiao_monstro):
    try:
        cursor = conn.cursor()
        cursor.execute("SELECT * FROM RegiaoMonstro WHERE IdRegiaoMonstro = %s;", (id_regiao_monstro,))
        result = cursor.fetchone()
        cursor.close()
        if result:
            regiao_monstro = RegiaoMonstro(*result)
            return regiao_monstro
        else:
            print("RegiaoMonstro não encontrada.")
            return None
    except Exception as e:
        print(f"Erro ao ler RegiaoMonstro: {e}")
        return None

def read_monstro_regiao(conn, id_regiao):
    try:
        cursor = conn.cursor()
        cursor.execute("SELECT Monstro.* FROM Monstro INNER JOIN RegiaoMonstro ON Monstro.IdMonstro = RegiaoMonstro.Monstro WHERE RegiaoMonstro.Regiao = %s;", (id_regiao,))
        result = cursor.fetchall()
        cursor.close()
        if result:
            regiao_list = [Monstro(*row) for row in result]
            return regiao_list
        else:
            print("Monstros não encontrados.")
            return []
    except Exception as e:
        print(f"Erro ao ler Monstro: {e}")
        return []

def read_all_regioes_monstro(conn):
    try:
        cursor = conn.cursor()
        cursor.execute("SELECT * FROM RegiaoMonstro;")
        results = cursor.fetchall()
        cursor.close()
        regioes_monstro = [RegiaoMonstro(*result) for result in results]
        return regioes_monstro
    except Exception as e:
        print(f"Erro ao ler todas as RegioesMonstro: {e}")
        return None

def update_regiao_monstro(conn, regiao_monstro):
    try:
        cursor = conn.cursor()
        cursor.execute("UPDATE RegiaoMonstro SET Regiao = %s, Monstro = %s WHERE IdRegiaoMonstro = %s;",
                       (regiao_monstro.regiao, regiao_monstro.monstro, regiao_monstro.id_regiao_monstro))
        conn.commit()
        cursor.close()
        print("RegiaoMonstro atualizada com sucesso.")
    except Exception as e:
        conn.rollback()
        print(f"Erro ao atualizar RegiaoMonstro: {e}")

def delete_regiao_monstro(conn, id_regiao_monstro):
    try:
        cursor = conn.cursor()
        cursor.execute("DELETE FROM RegiaoMonstro WHERE IdRegiaoMonstro = %s;", (id_regiao_monstro,))
        conn.commit()
        cursor.close()
        print("RegiaoMonstro excluída com sucesso.")
    except Exception as e:
        conn.rollback()
        print(f"Erro ao excluir RegiaoMonstro: {e}")

def create_ataca_monstro(conn, ataca_monstro):
    try:
        cursor = conn.cursor()
        cursor.execute("INSERT INTO AtacaMonstro (PC, Monstro, Dano, Horario) VALUES (%s, %s, %s, %s) RETURNING IdAtacaMonstro;",
                       (ataca_monstro.pc, ataca_monstro.monstro, ataca_monstro.dano, ataca_monstro.horario))
        id_ataca_monstro = cursor.fetchone()[0]
        conn.commit()
        cursor.close()
        return id_ataca_monstro
    except Exception as e:
        conn.rollback()
        print(f"Erro ao criar AtacaMonstro: {e}")
        return None

def read_ataca_monstro(conn, id_ataca_monstro):
    try:
        cursor = conn.cursor()
        cursor.execute("SELECT * FROM AtacaMonstro WHERE IdAtacaMonstro = %s;", (id_ataca_monstro,))
        result = cursor.fetchone()
        cursor.close()
        if result:
            ataca_monstro = AtacaMonstro(*result)
            return ataca_monstro
        else:
            print("AtacaMonstro não encontrado.")
            return None
    except Exception as e:
        print(f"Erro ao ler AtacaMonstro: {e}")
        return None

def read_all_ataques_monstro(conn):
    try:
        cursor = conn.cursor()
        cursor.execute("SELECT * FROM AtacaMonstro;")
        results = cursor.fetchall()
        cursor.close()
        ataques_monstro = [AtacaMonstro(*result) for result in results]
        return ataques_monstro
    except Exception as e:
        print(f"Erro ao ler todos os AtaquesMonstro: {e}")
        return None

def update_ataca_monstro(conn, ataca_monstro):
    try:
        cursor = conn.cursor()
        cursor.execute("UPDATE AtacaMonstro SET PC = %s, Monstro = %s, Dano = %s, Horario = %s WHERE IdAtacaMonstro = %s;",
                       (ataca_monstro.pc, ataca_monstro.monstro, ataca_monstro.dano, ataca_monstro.horario, ataca_monstro.id_ataca_monstro))
        conn.commit()
        cursor.close()
        print("AtacaMonstro atualizado com sucesso.")
    except Exception as e:
        conn.rollback()
        print(f"Erro ao atualizar AtacaMonstro: {e}")

def delete_ataca_monstro(conn, id_ataca_monstro):
    try:
        cursor = conn.cursor()
        cursor.execute("DELETE FROM AtacaMonstro WHERE IdAtacaMonstro = %s;", (id_ataca_monstro,))
        conn.commit()
        cursor.close()
        print("AtacaMonstro excluído com sucesso.")
    except Exception as e:
        conn.rollback()
        print(f"Erro ao excluir AtacaMonstro: {e}")

def create_missao(conn, missao):
    try:
        cursor = conn.cursor()
        cursor.execute("INSERT INTO Missao (Mapa, NPC, Nome, Nivel, Tipo, Cliente, Descricao, MaximoDesmaios, Tempo, Premio, Resumo, RanqueMinimo) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s) RETURNING IdMissao;",
                       (missao.mapa, missao.npc, missao.nome, missao.nivel, missao.tipo, missao.cliente, missao.descricao, missao.maximo_desmaios, missao.tempo, missao.premio, missao.resumo, missao.ranque_minimo))
        id_missao = cursor.fetchone()[0]
        conn.commit()
        cursor.close()
        return id_missao
    except Exception as e:
        conn.rollback()
        print(f"Erro ao criar Missao: {e}")
        return None

def read_missao(conn, id_missao):
    try:
        cursor = conn.cursor()
        cursor.execute("SELECT * FROM Missao WHERE IdMissao = %s;", (id_missao,))
        result = cursor.fetchone()
        cursor.close()
        if result:
            missao = Missao(*result)
            return missao
        else:
            print("Missao não encontrada.")
            return None
    except Exception as e:
        print(f"Erro ao ler Missao: {e}")
        return None

def read_all_missoes(conn):
    try:
        cursor = conn.cursor()
        cursor.execute("SELECT * FROM Missao;")
        results = cursor.fetchall()
        cursor.close()
        missoes = [Missao(*result) for result in results]
        return missoes
    except Exception as e:
        print(f"Erro ao ler todas as Missoes: {e}")
        return None

def read_missao_player(conn, id_player):
    try:
        cursor = conn.cursor()
        cursor.execute("""
            SELECT  m.*
            FROM Missao m 
            LEFT OUTER JOIN MissaoPreReq mp ON m.IdMissao = mp.Missao
            WHERE mp.MissaoPreReq IS NULL OR mp.MissaoPreReq in 
            (SELECT MISSAO FROM RealizaMissao WHERE STATUS=5 and PC=%s)
            ORDER BY IdMissao;

        """, (id_player, ))
        results = cursor.fetchall()
        cursor.close()
        missoes = [Missao(*result) for result in results]
        return missoes
    except Exception as e:
        print(f"Erro ao ler todas as Missoes: {e}")
        return []




def read_missao_ativa(conn,id_player):
    try:
        cursor = conn.cursor()
        cursor.execute("SELECT Missao.* FROM Missao JOIN RealizaMissao ON Missao.IdMissao = RealizaMissao.Missao WHERE RealizaMissao.PC = %s AND (RealizaMissao.Status > 0 AND RealizaMissao.Status < 4);", (id_player,))
        result = cursor.fetchone()
        cursor.close()
        if result:
            missao = Missao(*result)
            return missao
        else:
            print("Missao não encontrada.")
            return None
    except Exception as e:
        print(f"Erro ao ler Missao: {e}")
        return None

def cancela_missao(conn,id_player,id_missao):
    try:
        cursor = conn.cursor()

        # Define o status de RealizaMissao para 0 para a missão específica do jogador
        cursor.execute("UPDATE RealizaMissao SET Status = 0 WHERE PC = %s AND Missao = %s;", (id_player, id_missao))
        conn.commit()
        cursor.close()

    except Exception as e:
        print(f"Erro ao cancelar Missão: {e}")
    

def update_missao(conn, missao):
    try:
        cursor = conn.cursor()
        cursor.execute("UPDATE Missao SET Mapa = %s, NPC = %s, Nome = %s, Nivel = %s, Tipo = %s, Cliente = %s, Descricao = %s, MaximoDesmaios = %s, Tempo = %s, Premio = %s, Resumo = %s, RanqueMinimo = %s WHERE IdMissao = %s;",
                       (missao.mapa, missao.npc, missao.nome, missao.nivel, missao.tipo, missao.cliente, missao.descricao, missao.maximo_desmaios, missao.tempo, missao.premio, missao.resumo, missao.ranque_minimo, missao.id_missao))
        conn.commit()
        cursor.close()
        print("Missao atualizada com sucesso.")
    except Exception as e:
        conn.rollback()
        print(f"Erro ao atualizar Missao: {e}")

def delete_missao(conn, id_missao):
    try:
        cursor = conn.cursor()
        cursor.execute("DELETE FROM Missao WHERE IdMissao = %s;", (id_missao,))
        conn.commit()
        cursor.close()
        print("Missao excluída com sucesso.")
    except Exception as e:
        conn.rollback()
        print(f"Erro ao excluir Missao: {e}")
        
def create_missao_prereq(conn, missao_prereq):
    try:
        cursor = conn.cursor()
        cursor.execute("INSERT INTO MissaoPreReq (MissaoPrereq, Missao) VALUES (%s, %s) RETURNING IdMissaoPrereq;",
                       (missao_prereq.missao_prereq, missao_prereq.missao))
        id_missao_prereq = cursor.fetchone()[0]
        conn.commit()
        cursor.close()
        return id_missao_prereq
    except Exception as e:
        conn.rollback()
        print(f"Erro ao criar MissaoPreReq: {e}")
        return None

def read_missao_prereq(conn, id_missao_prereq):
    try:
        cursor = conn.cursor()
        cursor.execute("SELECT * FROM MissaoPreReq WHERE IdMissaoPrereq = %s;", (id_missao_prereq,))
        result = cursor.fetchone()
        cursor.close()
        if result:
            missao_prereq = MissaoPreReq(*result)
            return missao_prereq
        else:
            print("MissaoPreReq não encontrada.")
            return None
    except Exception as e:
        print(f"Erro ao ler MissaoPreReq: {e}")
        return None

def read_all_missoes_prereq(conn):
    try:
        cursor = conn.cursor()
        cursor.execute("SELECT * FROM MissaoPreReq;")
        results = cursor.fetchall()
        cursor.close()
        missoes_prereq = [MissaoPreReq(*result) for result in results]
        return missoes_prereq
    except Exception as e:
        print(f"Erro ao ler todas as MissoesPreReq: {e}")
        return None

def update_missao_prereq(conn, missao_prereq):
    try:
        cursor = conn.cursor()
        cursor.execute("UPDATE MissaoPreReq SET MissaoPrereq = %s, Missao = %s WHERE IdMissaoPrereq = %s;",
                       (missao_prereq.missao_prereq, missao_prereq.missao, missao_prereq.id_missao_prereq))
        conn.commit()
        cursor.close()
        print("MissaoPreReq atualizada com sucesso.")
    except Exception as e:
        conn.rollback()
        print(f"Erro ao atualizar MissaoPreReq: {e}")

def delete_missao_prereq(conn, id_missao_prereq):
    try:
        cursor = conn.cursor()
        cursor.execute("DELETE FROM MissaoPreReq WHERE IdMissaoPrereq = %s;", (id_missao_prereq,))
        conn.commit()
        cursor.close()
        print("MissaoPreReq excluída com sucesso.")
    except Exception as e:
        conn.rollback()
        print(f"Erro ao excluir MissaoPreReq: {e}")
        
def create_etapa_missao(conn, etapa_missao):
    try:
        cursor = conn.cursor()
        cursor.execute("INSERT INTO EtapaMissao (Missao, Nome, Status, Descricao) VALUES (%s, %s, %s, %s) RETURNING IdEtapaMissao;",
                       (etapa_missao.missao, etapa_missao.nome, etapa_missao.status, etapa_missao.descricao))
        id_etapa_missao = cursor.fetchone()[0]
        conn.commit()
        cursor.close()
        return id_etapa_missao
    except Exception as e:
        conn.rollback()
        print(f"Erro ao criar EtapaMissao: {e}")
        return None

def read_etapa_missao(conn, id_etapa_missao):
    try:
        cursor = conn.cursor()
        cursor.execute("SELECT * FROM EtapaMissao WHERE IdEtapaMissao = %s;", (id_etapa_missao,))
        result = cursor.fetchone()
        cursor.close()
        if result:
            etapa_missao = EtapaMissao(*result)
            return etapa_missao
        else:
            print("EtapaMissao não encontrada.")
            return None
    except Exception as e:
        print(f"Erro ao ler EtapaMissao: {e}")
        return None

def read_all_etapas_missao(conn):
    try:
        cursor = conn.cursor()
        cursor.execute("SELECT * FROM EtapaMissao;")
        results = cursor.fetchall()
        cursor.close()
        etapas_missao = [EtapaMissao(*result) for result in results]
        return etapas_missao
    except Exception as e:
        print(f"Erro ao ler todas as EtapasMissao: {e}")
        return None

def update_etapa_missao(conn, etapa_missao):
    try:
        cursor = conn.cursor()
        cursor.execute("UPDATE EtapaMissao SET Missao = %s, Nome = %s, Status = %s, Descricao = %s WHERE IdEtapaMissao = %s;",
                       (etapa_missao.missao, etapa_missao.nome, etapa_missao.status, etapa_missao.descricao, etapa_missao.id_etapa_missao))
        conn.commit()
        cursor.close()
        print("EtapaMissao atualizada com sucesso.")
    except Exception as e:
        conn.rollback()
        print(f"Erro ao atualizar EtapaMissao: {e}")

def delete_etapa_missao(conn, id_etapa_missao):
    try:
        cursor = conn.cursor()
        cursor.execute("DELETE FROM EtapaMissao WHERE IdEtapaMissao = %s;", (id_etapa_missao,))
        conn.commit()
        cursor.close()
        print("EtapaMissao excluída com sucesso.")
    except Exception as e:
        conn.rollback()
        print(f"Erro ao excluir EtapaMissao: {e}")
        
def create_etapa_monstro(conn, etapa_monstro):
    try:
        cursor = conn.cursor()
        cursor.execute("INSERT INTO EtapaMonstro (EtapaMissao, Monstro, Quantidade) VALUES (%s, %s, %s) RETURNING IdEtapaMonstro;",
                       (etapa_monstro.etapa_missao, etapa_monstro.monstro, etapa_monstro.quantidade))
        id_etapa_monstro = cursor.fetchone()[0]
        conn.commit()
        cursor.close()
        return id_etapa_monstro
    except Exception as e:
        conn.rollback()
        print(f"Erro ao criar EtapaMonstro: {e}")
        return None

def read_etapa_monstro(conn, id_etapa_monstro):
    try:
        cursor = conn.cursor()
        cursor.execute("SELECT * FROM EtapaMonstro WHERE IdEtapaMonstro = %s;", (id_etapa_monstro,))
        result = cursor.fetchone()
        cursor.close()
        if result:
            etapa_monstro = EtapaMonstro(*result)
            return etapa_monstro
        else:
            print("EtapaMonstro não encontrada.")
            return None
    except Exception as e:
        print(f"Erro ao ler EtapaMonstro: {e}")
        return None

def read_missao_etapas_monstro(conn):
    try:
        cursor = conn.cursor()
        cursor.execute("SELECT * FROM EtapaMonstro Where;")
        results = cursor.fetchall()
        cursor.close()
        etapas_monstro = [EtapaMonstro(*result) for result in results]
        return etapas_monstro
    except Exception as e:
        print(f"Erro ao ler todas as EtapasMonstro: {e}")
        return None

def update_etapa_monstro(conn, etapa_monstro):
    try:
        cursor = conn.cursor()
        cursor.execute("UPDATE EtapaMonstro SET EtapaMissao = %s, Monstro = %s, Quantidade = %s WHERE IdEtapaMonstro = %s;",
                       (etapa_monstro.etapa_missao, etapa_monstro.monstro, etapa_monstro.quantidade, etapa_monstro.id_etapa_monstro))
        conn.commit()
        cursor.close()
        print("EtapaMonstro atualizada com sucesso.")
    except Exception as e:
        conn.rollback()
        print(f"Erro ao atualizar EtapaMonstro: {e}")

def delete_etapa_monstro(conn, id_etapa_monstro):
    try:
        cursor = conn.cursor()
        cursor.execute("DELETE FROM EtapaMonstro WHERE IdEtapaMonstro = %s;", (id_etapa_monstro,))
        conn.commit()
        cursor.close()
        print("EtapaMonstro excluída com sucesso.")
    except Exception as e:
        conn.rollback()
        print(f"Erro ao excluir EtapaMonstro: {e}")

def create_etapa_fala(conn, etapa_fala):
    try:
        cursor = conn.cursor()
        cursor.execute("INSERT INTO EtapaFala (EtapaMissao, Fala) VALUES (%s, %s) RETURNING IdEtapaFala;",
                       (etapa_fala.etapa_missao, etapa_fala.fala))
        id_etapa_fala = cursor.fetchone()[0]
        conn.commit()
        cursor.close()
        return id_etapa_fala
    except Exception as e:
        conn.rollback()
        print(f"Erro ao criar EtapaFala: {e}")
        return None

def read_etapa_fala(conn, id_etapa_fala):
    try:
        cursor = conn.cursor()
        cursor.execute("SELECT * FROM EtapaFala WHERE IdEtapaFala = %s;", (id_etapa_fala,))
        result = cursor.fetchone()
        cursor.close()
        if result:
            etapa_fala = EtapaFala(*result)
            return etapa_fala
        else:
            print("EtapaFala não encontrada.")
            return None
    except Exception as e:
        print(f"Erro ao ler EtapaFala: {e}")
        return None

def read_all_etapas_fala(conn):
    try:
        cursor = conn.cursor()
        cursor.execute("SELECT * FROM EtapaFala;")
        results = cursor.fetchall()
        cursor.close()
        etapas_fala = [EtapaFala(*result) for result in results]
        return etapas_fala
    except Exception as e:
        print(f"Erro ao ler todas as EtapasFala: {e}")
        return None

def update_etapa_fala(conn, etapa_fala):
    try:
        cursor = conn.cursor()
        cursor.execute("UPDATE EtapaFala SET EtapaMissao = %s, Fala = %s WHERE IdEtapaFala = %s;",
                       (etapa_fala.etapa_missao, etapa_fala.fala, etapa_fala.id_etapa_fala))
        conn.commit()
        cursor.close()
        print("EtapaFala atualizada com sucesso.")
    except Exception as e:
        conn.rollback()
        print(f"Erro ao atualizar EtapaFala: {e}")

def delete_etapa_fala(conn, id_etapa_fala):
    try:
        cursor = conn.cursor()
        cursor.execute("DELETE FROM EtapaFala WHERE IdEtapaFala = %s;", (id_etapa_fala,))
        conn.commit()
        cursor.close()
        print("EtapaFala excluída com sucesso.")
    except Exception as e:
        conn.rollback()
        print(f"Erro ao excluir EtapaFala: {e}")

def create_realiza_missao(conn, pc_id, missao_id):
    try:
        cursor = conn.cursor()
        cursor.execute("CALL PegarMissao(%s,%s);",
                       (pc_id, missao_id))
        conn.commit()
        cursor.close()
    except Exception as e:
        conn.rollback()
        print(f"Erro ao criar RealizaMissao: {e}")
        return None

def read_realiza_missao(conn, id_realiza_missao):
    try:
        cursor = conn.cursor()
        cursor.execute("SELECT * FROM RealizaMissao WHERE IdRealizaMissao = %s;", (id_realiza_missao,))
        result = cursor.fetchone()
        cursor.close()
        if result:
            realiza_missao = RealizaMissao(*result)
            return realiza_missao
        else:
            print("RealizaMissao não encontrada.")
            return None
    except Exception as e:
        print(f"Erro ao ler RealizaMissao: {e}")
        return None

def read_all_realizacoes_missao(conn):
    try:
        cursor = conn.cursor()
        cursor.execute("SELECT * FROM RealizaMissao;")
        results = cursor.fetchall()
        cursor.close()
        realizacoes_missao = [RealizaMissao(*result) for result in results]
        return realizacoes_missao
    except Exception as e:
        print(f"Erro ao ler todas as RealizacoesMissao: {e}")
        return None

def update_realiza_missao(conn, realiza_missao):
    try:
        cursor = conn.cursor()
        cursor.execute("UPDATE RealizaMissao SET Missao = %s, PC = %s, Status = %s WHERE IdRealizaMissao = %s;",
                       (realiza_missao.missao, realiza_missao.pc, realiza_missao.status, realiza_missao.id_realiza_missao))
        conn.commit()
        cursor.close()
        print("RealizaMissao atualizada com sucesso.")
    except Exception as e:
        conn.rollback()
        print(f"Erro ao atualizar RealizaMissao: {e}")

def delete_realiza_missao(conn, id_realiza_missao):
    try:
        cursor = conn.cursor()
        cursor.execute("DELETE FROM RealizaMissao WHERE IdRealizaMissao = %s;", (id_realiza_missao,))
        conn.commit()
        cursor.close()
        print("RealizaMissao excluída com sucesso.")
    except Exception as e:
        conn.rollback()
        print(f"Erro ao excluir RealizaMissao: {e}")
        
def create_inventario(conn, inventario):
    try:
        cursor = conn.cursor()
        cursor.execute("INSERT INTO Inventario (PC, CapacidadeMaxima) VALUES (%s, %s) RETURNING IdInventario;",
                       (inventario.pc, inventario.capacidade_maxima))
        id_inventario = cursor.fetchone()[0]
        conn.commit()
        cursor.close()
        return id_inventario
    except Exception as e:
        conn.rollback()
        print(f"Erro ao criar Inventario: {e}")
        return None

def read_inventario(conn, id_inventario):
    try:
        cursor = conn.cursor()
        cursor.execute("SELECT * FROM Inventario WHERE IdInventario = %s;", (id_inventario,))
        result = cursor.fetchone()
        cursor.close()
        if result:
            inventario = Inventario(*result)
            return inventario
        else:
            print("Inventario não encontrado.")
            return None
    except Exception as e:
        print(f"Erro ao ler Inventario: {e}")
        return None

def read_all_inventarios(conn):
    try:
        cursor = conn.cursor()
        cursor.execute("SELECT * FROM Inventario;")
        results = cursor.fetchall()
        cursor.close()
        inventarios = [Inventario(*result) for result in results]
        return inventarios
    except Exception as e:
        print(f"Erro ao ler todos os Inventarios: {e}")
        return None

def update_inventario(conn, inventario):
    try:
        cursor = conn.cursor()
        cursor.execute("UPDATE Inventario SET PC = %s, CapacidadeMaxima = %s WHERE IdInventario = %s;",
                       (inventario.pc, inventario.capacidade_maxima, inventario.id_inventario))
        conn.commit()
        cursor.close()
        print("Inventario atualizado com sucesso.")
    except Exception as e:
        conn.rollback()
        print(f"Erro ao atualizar Inventario: {e}")

def delete_inventario(conn, id_inventario):
    try:
        cursor = conn.cursor()
        cursor.execute("DELETE FROM Inventario WHERE IdInventario = %s;", (id_inventario,))
        conn.commit()
        cursor.close()
        print("Inventario excluído com sucesso.")
    except Exception as e:
        conn.rollback()
        print(f"Erro ao excluir Inventario: {e}")
        
def create_forja(conn, forja):
    try:
        cursor = conn.cursor()
        cursor.execute("INSERT INTO Forja (NPC, Tipo) VALUES (%s, %s) RETURNING IdForja;",
                       (forja.npc, forja.tipo))
        id_forja = cursor.fetchone()[0]
        conn.commit()
        cursor.close()
        return id_forja
    except Exception as e:
        conn.rollback()
        print(f"Erro ao criar Forja: {e}")
        return None

def read_forja(conn, id_forja):
    try:
        cursor = conn.cursor()
        cursor.execute("SELECT * FROM Forja WHERE IdForja = %s;", (id_forja,))
        result = cursor.fetchone()
        cursor.close()
        if result:
            forja = Forja(*result)
            return forja
        else:
            print("Forja não encontrada.")
            return None
    except Exception as e:
        print(f"Erro ao ler Forja: {e}")
        return None

def read_all_forjas(conn):
    try:
        cursor = conn.cursor()
        cursor.execute("SELECT * FROM Forja;")
        results = cursor.fetchall()
        cursor.close()
        forjas = [Forja(*result) for result in results]
        return forjas
    except Exception as e:
        print(f"Erro ao ler todas as Forjas: {e}")
        return None

def update_forja(conn, forja):
    try:
        cursor = conn.cursor()
        cursor.execute("UPDATE Forja SET NPC = %s, Tipo = %s WHERE IdForja = %s;",
                       (forja.npc, forja.tipo, forja.id_forja))
        conn.commit()
        cursor.close()
        print("Forja atualizada com sucesso.")
    except Exception as e:
        conn.rollback()
        print(f"Erro ao atualizar Forja: {e}")

def delete_forja(conn, id_forja):
    try:
        cursor = conn.cursor()
        cursor.execute("DELETE FROM Forja WHERE IdForja = %s;", (id_forja,))
        conn.commit()
        cursor.close()
        print("Forja excluída com sucesso.")
    except Exception as e:
        conn.rollback()
        print(f"Erro ao excluir Forja: {e}")
        
def create_loja(conn, loja):
    try:
        cursor = conn.cursor()
        cursor.execute("INSERT INTO Loja (NPC, Tipo) VALUES (%s, %s) RETURNING IdLoja;",
                       (loja.npc, loja.tipo))
        id_loja = cursor.fetchone()[0]
        conn.commit()
        cursor.close()
        return id_loja
    except Exception as e:
        conn.rollback()
        print(f"Erro ao criar Loja: {e}")
        return None

def read_loja(conn, id_loja):
    try:
        cursor = conn.cursor()
        cursor.execute("SELECT * FROM Loja WHERE IdLoja = %s;", (id_loja,))
        result = cursor.fetchone()
        cursor.close()
        if result:
            loja = Loja(*result)
            return loja
        else:
            print("Loja não encontrada.")
            return None
    except Exception as e:
        print(f"Erro ao ler Loja: {e}")
        return None

def read_all_lojas(conn):
    try:
        cursor = conn.cursor()
        cursor.execute("SELECT * FROM Loja;")
        results = cursor.fetchall()
        cursor.close()
        lojas = [Loja(*result) for result in results]
        return lojas
    except Exception as e:
        print(f"Erro ao ler todas as Lojas: {e}")
        return None

def read_npc_lojas(conn,npc):
    try:
        cursor = conn.cursor()
        cursor.execute("SELECT * FROM Loja WHERE npc=%s;"%(npc))
        results = cursor.fetchall()
        cursor.close()
        lojas = [Loja(*result) for result in results]
        return lojas
    except Exception as e:
        print(f"Erro ao ler todas as Lojas: {e}")
        return None
def update_loja(conn, loja):
    try:
        cursor = conn.cursor()
        cursor.execute("UPDATE Loja SET NPC = %s, Tipo = %s WHERE IdLoja = %s;",
                       (loja.npc, loja.tipo, loja.id_loja))
        conn.commit()
        cursor.close()
        print("Loja atualizada com sucesso.")
    except Exception as e:
        conn.rollback()
        print(f"Erro ao atualizar Loja: {e}")

def delete_loja(conn, id_loja):
    try:
        cursor = conn.cursor()
        cursor.execute("DELETE FROM Loja WHERE IdLoja = %s;", (id_loja,))
        conn.commit()
        cursor.close()
        print("Loja excluída com sucesso.")
    except Exception as e:
        conn.rollback()
        print(f"Erro ao excluir Loja: {e}")
        
def create_equipamento(conn, equipamento):
    try:
        cursor = conn.cursor()
        cursor.execute("INSERT INTO Equipamento (Categoria) VALUES (%s) RETURNING IdEquipamento;",
                       (equipamento.categoria,))
        id_equipamento = cursor.fetchone()[0]
        conn.commit()
        cursor.close()
        return id_equipamento
    except Exception as e:
        conn.rollback()
        print(f"Erro ao criar Equipamento: {e}")
        return None

def read_equipamento(conn, id_equipamento):
    try:
        cursor = conn.cursor()
        cursor.execute("SELECT * FROM Equipamento WHERE IdEquipamento = %s;", (id_equipamento,))
        result = cursor.fetchone()
        cursor.close()
        if result:
            equipamento = Equipamento(*result)
            return equipamento
        else:
            print("Equipamento não encontrado.")
            return None
    except Exception as e:
        print(f"Erro ao ler Equipamento: {e}")
        return None

def read_all_equipamentos(conn):
    try:
        cursor = conn.cursor()
        cursor.execute("SELECT * FROM Equipamento;")
        results = cursor.fetchall()
        cursor.close()
        equipamentos = [Equipamento(*result) for result in results]
        return equipamentos
    except Exception as e:
        print(f"Erro ao ler todos os Equipamentos: {e}")
        return None

def update_equipamento(conn, equipamento):
    try:
        cursor = conn.cursor()
        cursor.execute("UPDATE Equipamento SET Categoria = %s WHERE IdEquipamento = %s;",
                       (equipamento.categoria, equipamento.id_equipamento))
        conn.commit()
        cursor.close()
        print("Equipamento atualizado com sucesso.")
    except Exception as e:
        conn.rollback()
        print(f"Erro ao atualizar Equipamento: {e}")

def delete_equipamento(conn, id_equipamento):
    try:
        cursor = conn.cursor()
        cursor.execute("DELETE FROM Equipamento WHERE IdEquipamento = %s;", (id_equipamento,))
        conn.commit()
        cursor.close()
        print("Equipamento excluído com sucesso.")
    except Exception as e:
        conn.rollback()
        print(f"Erro ao excluir Equipamento: {e}")

def create_utiliza_equipamento(conn, utiliza_equipamento):
    try:
        cursor = conn.cursor()
        cursor.execute("INSERT INTO UtilizaEquipamento (PC, Equipamento) VALUES (%s, %s) RETURNING IdUtilizaEquipamento;",
                       (utiliza_equipamento.pc, utiliza_equipamento.equipamento))
        id_utiliza_equipamento = cursor.fetchone()[0]
        conn.commit()
        cursor.close()
        return id_utiliza_equipamento
    except Exception as e:
        conn.rollback()
        print(f"Erro ao criar UtilizaEquipamento: {e}")
        return None

def read_utiliza_equipamento(conn, id_utiliza_equipamento):
    try:
        cursor = conn.cursor()
        cursor.execute("SELECT * FROM UtilizaEquipamento WHERE IdUtilizaEquipamento = %s;", (id_utiliza_equipamento,))
        result = cursor.fetchone()
        cursor.close()
        if result:
            utiliza_equipamento = UtilizaEquipamento(*result)
            return utiliza_equipamento
        else:
            print("UtilizaEquipamento não encontrado.")
            return None
    except Exception as e:
        print(f"Erro ao ler UtilizaEquipamento: {e}")
        return None

def read_all_utilizacoes_equipamento(conn):
    try:
        cursor = conn.cursor()
        cursor.execute("SELECT * FROM UtilizaEquipamento;")
        results = cursor.fetchall()
        cursor.close()
        utilizacoes_equipamento = [UtilizaEquipamento(*result) for result in results]
        return utilizacoes_equipamento
    except Exception as e:
        print(f"Erro ao ler todas as UtilizacoesEquipamento: {e}")
        return None

def update_utiliza_equipamento(conn, utiliza_equipamento):
    try:
        cursor = conn.cursor()
        cursor.execute("UPDATE UtilizaEquipamento SET PC = %s, Equipamento = %s WHERE IdUtilizaEquipamento = %s;",
                       (utiliza_equipamento.pc, utiliza_equipamento.equipamento, utiliza_equipamento.id_utiliza_equipamento))
        conn.commit()
        cursor.close()
        print("UtilizaEquipamento atualizado com sucesso.")
    except Exception as e:
        conn.rollback()
        print(f"Erro ao atualizar UtilizaEquipamento: {e}")

def delete_utiliza_equipamento(conn, id_utiliza_equipamento):
    try:
        cursor = conn.cursor()
        cursor.execute("DELETE FROM UtilizaEquipamento WHERE IdUtilizaEquipamento = %s;", (id_utiliza_equipamento,))
        conn.commit()
        cursor.close()
        print("UtilizaEquipamento excluído com sucesso.")
    except Exception as e:
        conn.rollback()
        print(f"Erro ao excluir UtilizaEquipamento: {e}")
def create_guarda_equipamento(conn, guarda_equipamento):
    try:
        cursor = conn.cursor()
        cursor.execute("INSERT INTO GuardaEquipamento (Inventario, Equipamento) VALUES (%s, %s) RETURNING IdGuardaEquipamento;",
                       (guarda_equipamento.inventario, guarda_equipamento.equipamento))
        id_guarda_equipamento = cursor.fetchone()[0]
        conn.commit()
        cursor.close()
        return id_guarda_equipamento
    except Exception as e:
        conn.rollback()
        print(f"Erro ao criar GuardaEquipamento: {e}")
        return None

def read_guarda_equipamento(conn, id_guarda_equipamento):
    try:
        cursor = conn.cursor()
        cursor.execute("SELECT * FROM GuardaEquipamento WHERE IdGuardaEquipamento = %s;", (id_guarda_equipamento,))
        result = cursor.fetchone()
        cursor.close()
        if result:
            guarda_equipamento = GuardaEquipamento(*result)
            return guarda_equipamento
        else:
            print("GuardaEquipamento não encontrado.")
            return None
    except Exception as e:
        print(f"Erro ao ler GuardaEquipamento: {e}")
        return None

def read_all_guardas_equipamento(conn):
    try:
        cursor = conn.cursor()
        cursor.execute("SELECT * FROM GuardaEquipamento;")
        results = cursor.fetchall()
        cursor.close()
        guardas_equipamento = [GuardaEquipamento(*result) for result in results]
        return guardas_equipamento
    except Exception as e:
        print(f"Erro ao ler todos os GuardasEquipamento: {e}")
        return None

def update_guarda_equipamento(conn, guarda_equipamento):
    try:
        cursor = conn.cursor()
        cursor.execute("UPDATE GuardaEquipamento SET Inventario = %s, Equipamento = %s WHERE IdGuardaEquipamento = %s;",
                       (guarda_equipamento.inventario, guarda_equipamento.equipamento, guarda_equipamento.id_guarda_equipamento))
        conn.commit()
        cursor.close()
        print("GuardaEquipamento atualizado com sucesso.")
    except Exception as e:
        conn.rollback()
        print(f"Erro ao atualizar GuardaEquipamento: {e}")

def delete_guarda_equipamento(conn, id_guarda_equipamento):
    try:
        cursor = conn.cursor()
        cursor.execute("DELETE FROM GuardaEquipamento WHERE IdGuardaEquipamento = %s;", (id_guarda_equipamento,))
        conn.commit()
        cursor.close()
        print("GuardaEquipamento excluído com sucesso.")
    except Exception as e:
        conn.rollback()
        print(f"Erro ao excluir GuardaEquipamento: {e}")
        
def create_cria_equipamento(conn, cria_equipamento):
    try:
        cursor = conn.cursor()
        cursor.execute("INSERT INTO CriaEquipamento (Forja, Equipamento) VALUES (%s, %s) RETURNING IdCriaEquipamento;",
                       (cria_equipamento.forja, cria_equipamento.equipamento))
        id_cria_equipamento = cursor.fetchone()[0]
        conn.commit()
        cursor.close()
        return id_cria_equipamento
    except Exception as e:
        conn.rollback()
        print(f"Erro ao criar CriaEquipamento: {e}")
        return None

def read_cria_equipamento(conn, id_cria_equipamento):
    try:
        cursor = conn.cursor()
        cursor.execute("SELECT * FROM CriaEquipamento WHERE IdCriaEquipamento = %s;", (id_cria_equipamento,))
        result = cursor.fetchone()
        cursor.close()
        if result:
            cria_equipamento = CriaEquipamento(*result)
            return cria_equipamento
        else:
            print("CriaEquipamento não encontrado.")
            return None
    except Exception as e:
        print(f"Erro ao ler CriaEquipamento: {e}")
        return None

def read_all_cria_equipamentos(conn):
    try:
        cursor = conn.cursor()
        cursor.execute("SELECT * FROM CriaEquipamento;")
        results = cursor.fetchall()
        cursor.close()
        cria_equipamentos = [CriaEquipamento(*result) for result in results]
        return cria_equipamentos
    except Exception as e:
        print(f"Erro ao ler todos os CriaEquipamentos: {e}")
        return None

def update_cria_equipamento(conn, cria_equipamento):
    try:
        cursor = conn.cursor()
        cursor.execute("UPDATE CriaEquipamento SET Forja = %s, Equipamento = %s WHERE IdCriaEquipamento = %s;",
                       (cria_equipamento.forja, cria_equipamento.equipamento, cria_equipamento.id_cria_equipamento))
        conn.commit()
        cursor.close()
        print("CriaEquipamento atualizado com sucesso.")
    except Exception as e:
        conn.rollback()
        print(f"Erro ao atualizar CriaEquipamento: {e}")

def delete_cria_equipamento(conn, id_cria_equipamento):
    try:
        cursor = conn.cursor()
        cursor.execute("DELETE FROM CriaEquipamento WHERE IdCriaEquipamento = %s;", (id_cria_equipamento,))
        conn.commit()
        cursor.close()
        print("CriaEquipamento excluído com sucesso.")
    except Exception as e:
        conn.rollback()
        print(f"Erro ao excluir CriaEquipamento: {e}")
        
def create_vende_equipamento(conn, vende_equipamento):
    try:
        cursor = conn.cursor()
        cursor.execute("INSERT INTO VendeEquipamento (Loja, Equipamento) VALUES (%s, %s) RETURNING IdVendeEquipamento;",
                       (vende_equipamento.loja, vende_equipamento.equipamento))
        id_vende_equipamento = cursor.fetchone()[0]
        conn.commit()
        cursor.close()
        return id_vende_equipamento
    except Exception as e:
        conn.rollback()
        print(f"Erro ao criar VendeEquipamento: {e}")
        return None

def read_vende_equipamento(conn, id_vende_equipamento):
    try:
        cursor = conn.cursor()
        cursor.execute("SELECT * FROM VendeEquipamento WHERE IdVendeEquipamento = %s;", (id_vende_equipamento,))
        result = cursor.fetchone()
        cursor.close()
        if result:
            vende_equipamento = VendeEquipamento(*result)
            return vende_equipamento
        else:
            print("VendeEquipamento não encontrado.")
            return None
    except Exception as e:
        print(f"Erro ao ler VendeEquipamento: {e}")
        return None

def read_all_vende_equipamentos(conn):
    try:
        cursor = conn.cursor()
        cursor.execute("SELECT * FROM VendeEquipamento;")
        results = cursor.fetchall()
        cursor.close()
        vende_equipamentos = [VendeEquipamento(*result) for result in results]
        return vende_equipamentos
    except Exception as e:
        print(f"Erro ao ler todos os VendeEquipamentos: {e}")
        return None

def update_vende_equipamento(conn, vende_equipamento):
    try:
        cursor = conn.cursor()
        cursor.execute("UPDATE VendeEquipamento SET Loja = %s, Equipamento = %s WHERE IdVendeEquipamento = %s;",
                       (vende_equipamento.loja, vende_equipamento.equipamento, vende_equipamento.id_vende_equipamento))
        conn.commit()
        cursor.close()
        print("VendeEquipamento atualizado com sucesso.")
    except Exception as e:
        conn.rollback()
        print(f"Erro ao atualizar VendeEquipamento: {e}")

def delete_vende_equipamento(conn, id_vende_equipamento):
    try:
        cursor = conn.cursor()
        cursor.execute("DELETE FROM VendeEquipamento WHERE IdVendeEquipamento = %s;", (id_vende_equipamento,))
        conn.commit()
        cursor.close()
        print("VendeEquipamento excluído com sucesso.")
    except Exception as e:
        conn.rollback()
        print(f"Erro ao excluir VendeEquipamento: {e}")
        
def create_amigato_equipamento(conn, amigato_equipamento):
    try:
        cursor = conn.cursor()
        cursor.execute("INSERT INTO AmigatoEquipamento (Amigato, Equipamento) VALUES (%s, %s) RETURNING IdAmigatoEquipamento;",
                       (amigato_equipamento.amigato, amigato_equipamento.equipamento))
        id_amigato_equipamento = cursor.fetchone()[0]
        conn.commit()
        cursor.close()
        return id_amigato_equipamento
    except Exception as e:
        conn.rollback()
        print(f"Erro ao criar AmigatoEquipamento: {e}")
        return None

def read_amigato_equipamento(conn, id_amigato_equipamento):
    try:
        cursor = conn.cursor()
        cursor.execute("SELECT * FROM AmigatoEquipamento WHERE IdAmigatoEquipamento = %s;", (id_amigato_equipamento,))
        result = cursor.fetchone()
        cursor.close()
        if result:
            amigato_equipamento = AmigatoEquipamento(*result)
            return amigato_equipamento
        else:
            print("AmigatoEquipamento não encontrado.")
            return None
    except Exception as e:
        print(f"Erro ao ler AmigatoEquipamento: {e}")
        return None

def read_all_amigatos_equipamento(conn):
    try:
        cursor = conn.cursor()
        cursor.execute("SELECT * FROM AmigatoEquipamento;")
        results = cursor.fetchall()
        cursor.close()
        amigatos_equipamento = [AmigatoEquipamento(*result) for result in results]
        return amigatos_equipamento
    except Exception as e:
        print(f"Erro ao ler todos os AmigatosEquipamento: {e}")
        return None

def update_amigato_equipamento(conn, amigato_equipamento):
    try:
        cursor = conn.cursor()
        cursor.execute("UPDATE AmigatoEquipamento SET Amigato = %s, Equipamento = %s WHERE IdAmigatoEquipamento = %s;",
                       (amigato_equipamento.amigato, amigato_equipamento.equipamento, amigato_equipamento.id_amigato_equipamento))
        conn.commit()
        cursor.close()
        print("AmigatoEquipamento atualizado com sucesso.")
    except Exception as e:
        conn.rollback()
        print(f"Erro ao atualizar AmigatoEquipamento: {e}")

def delete_amigato_equipamento(conn, id_amigato_equipamento):
    try:
        cursor = conn.cursor()
        cursor.execute("DELETE FROM AmigatoEquipamento WHERE IdAmigatoEquipamento = %s;", (id_amigato_equipamento,))
        conn.commit()
        cursor.close()
        print("AmigatoEquipamento excluído com sucesso.")
    except Exception as e:
        conn.rollback()
        print(f"Erro ao excluir AmigatoEquipamento: {e}")


def create_item(conn, item):
    try:
        cursor = conn.cursor()
        cursor.execute("INSERT INTO Item (Nome, Raridade, Tipo, Funcao, Descricao, ValorVenda, CustoCompra) "
                       "VALUES (%s, %s, %s, %s, %s, %s, %s) RETURNING IdItem;",
                       (item.nome, item.raridade, item.tipo, item.funcao, item.descricao, item.valor_venda, item.custo_compra))
        id_item = cursor.fetchone()[0]
        conn.commit()
        cursor.close()
        return id_item
    except Exception as e:
        conn.rollback()
        print(f"Erro ao criar Item: {e}")
        return None

def read_item(conn, id_item):
    try:
        cursor = conn.cursor()
        cursor.execute("SELECT * FROM Item WHERE IdItem = %s;", (id_item,))
        result = cursor.fetchone()
        cursor.close()
        if result:
            item = Item(*result)
            return item
        else:
            print("Item não encontrado.")
            return None
    except Exception as e:
        print(f"Erro ao ler Item: {e}")
        return None

def read_all_itens(conn):
    try:
        cursor = conn.cursor()
        cursor.execute("SELECT * FROM Item;")
        results = cursor.fetchall()
        cursor.close()
        itens = [Item(*result) for result in results]
        return itens
    except Exception as e:
        print(f"Erro ao ler todos os Itens: {e}")
        return None

def read_all_itens_consumidos(conn,id_item):
    cursor = conn.cursor()
    cursor.execute("SELECT i.* FROM Item i INNER JOIN CriaItem ci ON ci.ItemConsumido=i.IdItem WHERE ci.Item=%s;"%(id_item))
    results = cursor.fetchall()
    itens = [Item(*result) for result in results]
    cursor.execute("SELECT ci.Quantidade FROM Item i INNER JOIN CriaItem ci ON ci.ItemConsumido=i.IdItem WHERE ci.Item=%s;"%(id_item))


    quantidade = cursor.fetchall()
    resultado=[]
    for i in range(len(itens)):
        resultado.append({
            "quantidade":quantidade[i][0],
            "item":itens[i]
        })
    cursor.close()
    return resultado

def update_item(conn, item):
    try:
        cursor = conn.cursor()
        cursor.execute("UPDATE Item SET Nome = %s, Raridade = %s, Tipo = %s, Funcao = %s, "
                       "Descricao = %s, ValorVenda = %s, CustoCompra = %s WHERE IdItem = %s;",
                       (item.nome, item.raridade, item.tipo, item.funcao, item.descricao, item.valor_venda, item.custo_compra, item.id_item))
        conn.commit()
        cursor.close()
        print("Item atualizado com sucesso.")
    except Exception as e:
        conn.rollback()
        print(f"Erro ao atualizar Item: {e}")

def delete_item(conn, id_item):
    try:
        cursor = conn.cursor()
        cursor.execute("DELETE FROM Item WHERE IdItem = %s;", (id_item,))
        conn.commit()
        cursor.close()
        print("Item excluído com sucesso.")
    except Exception as e:
        conn.rollback()
        print(f"Erro ao excluir Item: {e}")

def create_dropa_item(conn, dropa_item):
    try:
        cursor = conn.cursor()
        cursor.execute("INSERT INTO DropaItem (Monstro, Item) VALUES (%s, %s) RETURNING IdDropaItem;",
                       (dropa_item.monstro, dropa_item.item))
        id_dropa_item = cursor.fetchone()[0]
        conn.commit()
        cursor.close()
        return id_dropa_item
    except Exception as e:
        conn.rollback()
        print(f"Erro ao criar DropaItem: {e}")
        return None

def read_dropa_item(conn, id_dropa_item):
    try:
        cursor = conn.cursor()
        cursor.execute("SELECT * FROM DropaItem WHERE IdDropaItem = %s;", (id_dropa_item,))
        result = cursor.fetchone()
        cursor.close()
        if result:
            dropa_item = DropaItem(*result)
            return dropa_item
        else:
            print("DrogaItem não encontrado.")
            return None
    except Exception as e:
        print(f"Erro ao ler DropaItem: {e}")
        return None

def read_all_droga_itens(conn):
    try:
        cursor = conn.cursor()
        cursor.execute("SELECT * FROM DropaItem;")
        results = cursor.fetchall()
        cursor.close()
        droga_itens = [DrogaItem(*result) for result in results]
        return droga_itens
    except Exception as e:
        print(f"Erro ao ler todos os DrogaItens: {e}")
        return None

def update_dropa_item(conn, dropa_item):
    try:
        cursor = conn.cursor()
        cursor.execute("UPDATE DropaItem SET Monstro = %s, Item = %s WHERE IdDropaItem = %s;",
                       (dropa_item.monstro, dropa_item.item, dropa_item.id_dropa_item))
        conn.commit()
        cursor.close()
        print("DrogaItem atualizado com sucesso.")
    except Exception as e:
        conn.rollback()
        print(f"Erro ao atualizar DrogaItem: {e}")

def delete_dropa_item(conn, id_dropa_item):
    try:
        cursor = conn.cursor()
        cursor.execute("DELETE FROM DropaItem WHERE IdDropaItem = %s;", (id_dropa_item,))
        conn.commit()
        cursor.close()
        print("DrogaItem excluído com sucesso.")
    except Exception as e:
        conn.rollback()
        print(f"Erro ao excluir DrogaItem: {e}")

def create_arma(conn, arma):
    try:
        cursor = conn.cursor()
        cursor.execute("INSERT INTO Arma (Nome, Nivel, Raridade, CustoCompra, ValorVenda, Descricao, Tipo, "
                       "Ataque, Afiacao, Elemento, ValorElemento) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s) "
                       "RETURNING IdArma;",
                       (arma.nome, arma.nivel, arma.raridade, arma.custo_compra, arma.valor_venda, arma.descricao, arma.tipo,
                        arma.ataque, arma.afiacao, arma.elemento, arma.valor_elemento))
        id_arma = cursor.fetchone()[0]
        conn.commit()
        cursor.close()
        return id_arma
    except Exception as e:
        conn.rollback()
        print(f"Erro ao criar Arma: {e}")
        return None

def read_arma(conn, id_arma):
    try:
        cursor = conn.cursor()
        cursor.execute("SELECT * FROM Arma WHERE IdArma = %s;", (id_arma,))
        result = cursor.fetchone()
        cursor.close()
        if result:
            arma = Arma(*result)
            return arma
        else:
            print("Arma não encontrada.")
            return None
    except Exception as e:
        print(f"Erro ao ler Arma: {e}")
        return None

def read_all_armas(conn):
    try:
        cursor = conn.cursor()
        cursor.execute("SELECT * FROM Arma;")
        results = cursor.fetchall()
        cursor.close()
        armas = [Arma(*result) for result in results]
        return armas
    except Exception as e:
        print(f"Erro ao ler todas as Armas: {e}")
        return None

def read_all_armas_forja(conn):
    try:
        cursor = conn.cursor()
        cursor.execute("""SELECT 
                            Arma.IdArma as id_arma,
                            Item.Nome as nome,
                            Item.Raridade as raridade,
                            Item.CustoCompra as custo_compra,
                            Item.ValorVenda as valor_venda,
                            Item.Descricao as descricao,
                            Item.Tipo as tipo,
                            Arma.Ataque as ataque,
                            Arma.Afiacao as afiacao,
                            Arma.Elemento as elemento,
                            Arma.ValorElemento as valor_elemento
                        FROM Arma
                        JOIN Item ON Arma.IdArma = Item.IdItem
                        JOIN CriaItem ON CriaItem.Item = Item.IdItem
                        WHERE Item.Tipo >= 18;""")
        results = cursor.fetchall()
        cursor.close()
        armas = [Arma(*result) for result in results]
        return armas
    except Exception as e:
        print(f"Erro ao ler todas as Armas: {e}")
        return None


def update_arma(conn, arma):
    try:
        cursor = conn.cursor()
        cursor.execute("UPDATE Arma SET Nome = %s, Nivel = %s, Raridade = %s, CustoCompra = %s, ValorVenda = %s, "
                       "Descricao = %s, Tipo = %s, Ataque = %s, Afiacao = %s, Elemento = %s, ValorElemento = %s "
                       "WHERE IdArma = %s;",
                       (arma.nome, arma.nivel, arma.raridade, arma.custo_compra, arma.valor_venda, arma.descricao, arma.tipo,
                        arma.ataque, arma.afiacao, arma.elemento, arma.valor_elemento, arma.id_arma))
        conn.commit()
        cursor.close()
        print("Arma atualizada com sucesso.")
    except Exception as e:
        conn.rollback()
        print(f"Erro ao atualizar Arma: {e}")

def delete_arma(conn, id_arma):
    try:
        cursor = conn.cursor()
        cursor.execute("DELETE FROM Arma WHERE IdArma = %s;", (id_arma,))
        conn.commit()
        cursor.close()
        print("Arma excluída com sucesso.")
    except Exception as e:
        conn.rollback()
        print(f"Erro ao excluir Arma: {e}")
        
def create_armadura(conn, armadura):
    try:
        cursor = conn.cursor()
        cursor.execute("INSERT INTO Armadura (Nome, Nivel, Raridade, CustoCompra, ValorVenda, Descricao, Tipo, Defesa, "
                       "Fogo, Agua, Raio, Gelo, Dragao) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s) "
                       "RETURNING IdArmadura;",
                       (armadura.nome, armadura.nivel, armadura.raridade, armadura.custo_compra, armadura.valor_venda,
                        armadura.descricao, armadura.tipo, armadura.defesa, armadura.fogo, armadura.agua, armadura.raio,
                        armadura.gelo, armadura.dragao))
        id_armadura = cursor.fetchone()[0]
        conn.commit()
        cursor.close()
        return id_armadura
    except Exception as e:
        conn.rollback()
        print(f"Erro ao criar Armadura: {e}")
        return None

def read_armadura(conn, id_armadura):
    try:
        cursor = conn.cursor()
        cursor.execute("SELECT * FROM Armadura WHERE IdArmadura = %s;", (id_armadura,))
        result = cursor.fetchone()
        cursor.close()
        if result:
            armadura = Armadura(*result)
            return armadura
        else:
            print("Armadura não encontrada.")
            return None
    except Exception as e:
        print(f"Erro ao ler Armadura: {e}")
        return None

def read_all_armaduras_forja(conn):
    cursor = conn.cursor()
    cursor.execute("""SELECT 
                        Armadura.IdArmadura as id_armadura,
                        Item.Nome as nome,
                        Item.Raridade as raridade,
                        Item.CustoCompra as custo_compra,
                        Item.ValorVenda as valor_venda,
                        Item.Descricao as descricao,
                        Item.Tipo as tipo,
                        Armadura.Defesa as defesa,
                        Armadura.Fogo as fogo,
                        Armadura.Agua as agua,
                        Armadura.Raio as raio,
                        Armadura.Gelo as gelo,
                        Armadura.Dragao as dragao
                    FROM Armadura
                    JOIN Item ON Armadura.IdArmadura = Item.IdItem
                    JOIN CriaItem ON CriaItem.Item = Item.IdItem
                    WHERE Item.Funcao LIKE '%Armadura%';""")
    results = cursor.fetchall()
    cursor.close()
    armaduras = [Armadura(*result) for result in results]
    return armaduras

def read_all_armaduras(conn):
    try:
        cursor = conn.cursor()
        cursor.execute("SELECT * FROM Armadura;")
        results = cursor.fetchall()
        cursor.close()
        armaduras = [Armadura(*result) for result in results]
        return armaduras
    except Exception as e:
        print(f"Erro ao ler todas as Armaduras: {e}")
        return None

def update_armadura(conn, armadura):
    try:
        cursor = conn.cursor()
        cursor.execute("UPDATE Armadura SET Nome = %s, Nivel = %s, Raridade = %s, CustoCompra = %s, ValorVenda = %s, "
                       "Descricao = %s, Tipo = %s, Defesa = %s, Fogo = %s, Agua = %s, Raio = %s, Gelo = %s, Dragao = %s "
                       "WHERE IdArmadura = %s;",
                       (armadura.nome, armadura.nivel, armadura.raridade, armadura.custo_compra, armadura.valor_venda,
                        armadura.descricao, armadura.tipo, armadura.defesa, armadura.fogo, armadura.agua, armadura.raio,
                        armadura.gelo, armadura.dragao, armadura.id_armadura))
        conn.commit()
        cursor.close()
        print("Armadura atualizada com sucesso.")
    except Exception as e:
        conn.rollback()
        print(f"Erro ao atualizar Armadura: {e}")

def delete_armadura(conn, id_armadura):
    try:
        cursor = conn.cursor()
        cursor.execute("DELETE FROM Armadura WHERE IdArmadura = %s;", (id_armadura,))
        conn.commit()
        cursor.close()
        print("Armadura excluída com sucesso.")
    except Exception as e:
        conn.rollback()
        print(f"Erro ao excluir Armadura: {e}")
        
def create_amuleto(conn, amuleto):
    try:
        cursor = conn.cursor()
        cursor.execute("INSERT INTO Amuleto (Nome, Nivel, Raridade, CustoCompra, ValorVenda, Descricao, Tipo, Melhoria) "
                       "VALUES (%s, %s, %s, %s, %s, %s, %s, %s) RETURNING IdAmuleto;",
                       (amuleto.nome, amuleto.nivel, amuleto.raridade, amuleto.custo_compra, amuleto.valor_venda,
                        amuleto.descricao, amuleto.tipo, amuleto.melhoria))
        id_amuleto = cursor.fetchone()[0]
        conn.commit()
        cursor.close()
        return id_amuleto
    except Exception as e:
        conn.rollback()
        print(f"Erro ao criar Amuleto: {e}")
        return None

def read_amuleto(conn, id_amuleto):
    try:
        cursor = conn.cursor()
        cursor.execute("SELECT * FROM Amuleto WHERE IdAmuleto = %s;", (id_amuleto,))
        result = cursor.fetchone()
        cursor.close()
        if result:
            amuleto = Amuleto(*result)
            return amuleto
        else:
            print("Amuleto não encontrado.")
            return None
    except Exception as e:
        print(f"Erro ao ler Amuleto: {e}")
        return None

def read_all_amuletos(conn):
    try:
        cursor = conn.cursor()
        cursor.execute("SELECT * FROM Amuleto;")
        results = cursor.fetchall()
        cursor.close()
        amuletos = [Amuleto(*result) for result in results]
        return amuletos
    except Exception as e:
        print(f"Erro ao ler todos os Amuletos: {e}")
        return None

def update_amuleto(conn, amuleto):
    try:
        cursor = conn.cursor()
        cursor.execute("UPDATE Amuleto SET Nome = %s, Nivel = %s, Raridade = %s, CustoCompra = %s, ValorVenda = %s, "
                       "Descricao = %s, Tipo = %s, Melhoria = %s WHERE IdAmuleto = %s;",
                       (amuleto.nome, amuleto.nivel, amuleto.raridade, amuleto.custo_compra, amuleto.valor_venda,
                        amuleto.descricao, amuleto.tipo, amuleto.melhoria, amuleto.id_amuleto))
        conn.commit()
        cursor.close()
        print("Amuleto atualizado com sucesso.")
    except Exception as e:
        conn.rollback()
        print(f"Erro ao atualizar Amuleto: {e}")

def delete_amuleto(conn, id_amuleto):
    try:
        cursor = conn.cursor()
        cursor.execute("DELETE FROM Amuleto WHERE IdAmuleto = %s;", (id_amuleto,))
        conn.commit()
        cursor.close()
        print("Amuleto excluído com sucesso.")
    except Exception as e:
        conn.rollback()
        print(f"Erro ao excluir Amuleto: {e}")
        
def create_ferramenta(conn, ferramenta):
    try:
        cursor = conn.cursor()
        cursor.execute("INSERT INTO Ferramenta (Nome, Nivel, Raridade, CustoCompra, ValorVenda, Descricao, Tipo, "
                       "Funcao, TempoEfeito, TempoRecarga) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s) "
                       "RETURNING IdFerramenta;",
                       (ferramenta.nome, ferramenta.nivel, ferramenta.raridade, ferramenta.custo_compra,
                        ferramenta.valor_venda, ferramenta.descricao, ferramenta.tipo, ferramenta.funcao,
                        ferramenta.tempo_efeito, ferramenta.tempo_recarga))
        id_ferramenta = cursor.fetchone()[0]
        conn.commit()
        cursor.close()
        return id_ferramenta
    except Exception as e:
        conn.rollback()
        print(f"Erro ao criar Ferramenta: {e}")
        return None

def read_ferramenta(conn, id_ferramenta):
    try:
        cursor = conn.cursor()
        cursor.execute("SELECT * FROM Ferramenta WHERE IdFerramenta = %s;", (id_ferramenta,))
        result = cursor.fetchone()
        cursor.close()
        if result:
            ferramenta = Ferramenta(*result)
            return ferramenta
        else:
            print("Ferramenta não encontrada.")
            return None
    except Exception as e:
        print(f"Erro ao ler Ferramenta: {e}")
        return None

def read_all_ferramentas(conn):
    try:
        cursor = conn.cursor()
        cursor.execute("SELECT * FROM Ferramenta;")
        results = cursor.fetchall()
        cursor.close()
        ferramentas = [Ferramenta(*result) for result in results]
        return ferramentas
    except Exception as e:
        print(f"Erro ao ler todas as Ferramentas: {e}")
        return None

def update_ferramenta(conn, ferramenta):
    try:
        cursor = conn.cursor()
        cursor.execute("UPDATE Ferramenta SET Nome = %s, Nivel = %s, Raridade = %s, CustoCompra = %s, ValorVenda = %s, "
                       "Descricao = %s, Tipo = %s, Funcao = %s, TempoEfeito = %s, TempoRecarga = %s "
                       "WHERE IdFerramenta = %s;",
                       (ferramenta.nome, ferramenta.nivel, ferramenta.raridade, ferramenta.custo_compra,
                        ferramenta.valor_venda, ferramenta.descricao, ferramenta.tipo, ferramenta.funcao,
                        ferramenta.tempo_efeito, ferramenta.tempo_recarga, ferramenta.id_ferramenta))
        conn.commit()
        cursor.close()
        print("Ferramenta atualizada com sucesso.")
    except Exception as e:
        conn.rollback()
        print(f"Erro ao atualizar Ferramenta: {e}")

def delete_ferramenta(conn, id_ferramenta):
    try:
        cursor = conn.cursor()
        cursor.execute("DELETE FROM Ferramenta WHERE IdFerramenta = %s;", (id_ferramenta,))
        conn.commit()
        cursor.close()
        print("Ferramenta excluída com sucesso.")
    except Exception as e:
        conn.rollback()
        print(f"Erro ao excluir Ferramenta: {e}")

def create_habilidade(conn, habilidade):
    try:
        cursor = conn.cursor()
        cursor.execute("INSERT INTO Habilidade (Nome, Nivel, Descricao, Funcao) VALUES (%s, %s, %s, %s) "
                       "RETURNING IdHabilidade;",
                       (habilidade.nome, habilidade.nivel, habilidade.descricao, habilidade.funcao))
        id_habilidade = cursor.fetchone()[0]
        conn.commit()
        cursor.close()
        return id_habilidade
    except Exception as e:
        conn.rollback()
        print(f"Erro ao criar Habilidade: {e}")
        return None

def read_habilidade(conn, id_habilidade):
    try:
        cursor = conn.cursor()
        cursor.execute("SELECT * FROM Habilidade WHERE IdHabilidade = %s;", (id_habilidade,))
        result = cursor.fetchone()
        cursor.close()
        if result:
            habilidade = Habilidade(*result)
            return habilidade
        else:
            print("Habilidade não encontrada.")
            return None
    except Exception as e:
        print(f"Erro ao ler Habilidade: {e}")
        return None

def read_all_habilidades(conn):
    try:
        cursor = conn.cursor()
        cursor.execute("SELECT * FROM Habilidade;")
        results = cursor.fetchall()
        cursor.close()
        habilidades = [Habilidade(*result) for result in results]
        return habilidades
    except Exception as e:
        print(f"Erro ao ler todas as Habilidades: {e}")
        return None

def update_habilidade(conn, habilidade):
    try:
        cursor = conn.cursor()
        cursor.execute("UPDATE Habilidade SET Nome = %s, Nivel = %s, Descricao = %s, Funcao = %s "
                       "WHERE IdHabilidade = %s;",
                       (habilidade.nome, habilidade.nivel, habilidade.descricao, habilidade.funcao, habilidade.id_habilidade))
        conn.commit()
        cursor.close()
        print("Habilidade atualizada com sucesso.")
    except Exception as e:
        conn.rollback()
        print(f"Erro ao atualizar Habilidade: {e}")

def delete_habilidade(conn, id_habilidade):
    try:
        cursor = conn.cursor()
        cursor.execute("DELETE FROM Habilidade WHERE IdHabilidade = %s;", (id_habilidade,))
        conn.commit()
        cursor.close()
        print("Habilidade excluída com sucesso.")
    except Exception as e:
        conn.rollback()
        print(f"Erro ao excluir Habilidade: {e}")
        
def create_habilidade_amuleto(conn, habilidade_amuleto):
    try:
        cursor = conn.cursor()
        cursor.execute("INSERT INTO HabilidadeAmuleto (Amuleto, Habilidade) VALUES (%s, %s) "
                       "RETURNING IdHabilidadeAmuleto;",
                       (habilidade_amuleto.amuleto, habilidade_amuleto.habilidade))
        id_habilidade_amuleto = cursor.fetchone()[0]
        conn.commit()
        cursor.close()
        return id_habilidade_amuleto
    except Exception as e:
        conn.rollback()
        print(f"Erro ao criar HabilidadeAmuleto: {e}")
        return None

def read_habilidade_amuleto(conn, id_habilidade_amuleto):
    try:
        cursor = conn.cursor()
        cursor.execute("SELECT * FROM HabilidadeAmuleto WHERE IdHabilidadeAmuleto = %s;", (id_habilidade_amuleto,))
        result = cursor.fetchone()
        cursor.close()
        if result:
            habilidade_amuleto = HabilidadeAmuleto(*result)
            return habilidade_amuleto
        else:
            print("HabilidadeAmuleto não encontrada.")
            return None
    except Exception as e:
        print(f"Erro ao ler HabilidadeAmuleto: {e}")
        return None

def read_all_habilidades_amuleto(conn):
    try:
        cursor = conn.cursor()
        cursor.execute("SELECT * FROM HabilidadeAmuleto;")
        results = cursor.fetchall()
        cursor.close()
        habilidades_amuleto = [HabilidadeAmuleto(*result) for result in results]
        return habilidades_amuleto
    except Exception as e:
        print(f"Erro ao ler todas as HabilidadesAmuleto: {e}")
        return None

def update_habilidade_amuleto(conn, habilidade_amuleto):
    try:
        cursor = conn.cursor()
        cursor.execute("UPDATE HabilidadeAmuleto SET Amuleto = %s, Habilidade = %s "
                       "WHERE IdHabilidadeAmuleto = %s;",
                       (habilidade_amuleto.amuleto, habilidade_amuleto.habilidade, habilidade_amuleto.id_habilidade_amuleto))
        conn.commit()
        cursor.close()
        print("HabilidadeAmuleto atualizada com sucesso.")
    except Exception as e:
        conn.rollback()
        print(f"Erro ao atualizar HabilidadeAmuleto: {e}")

def delete_habilidade_amuleto(conn, id_habilidade_amuleto):
    try:
        cursor = conn.cursor()
        cursor.execute("DELETE FROM HabilidadeAmuleto WHERE IdHabilidadeAmuleto = %s;", (id_habilidade_amuleto,))
        conn.commit()
        cursor.close()
        print("HabilidadeAmuleto excluída com sucesso.")
    except Exception as e:
        conn.rollback()
        print(f"Erro ao excluir HabilidadeAmuleto: {e}")
        

def create_habilidade_armadura(conn, habilidade_armadura):
    try:
        cursor = conn.cursor()
        cursor.execute("INSERT INTO HabilidadeArmadura (Armadura, Habilidade) VALUES (%s, %s) "
                       "RETURNING IdHabilidadeArmadura;",
                       (habilidade_armadura.armadura, habilidade_armadura.habilidade))
        id_habilidade_armadura = cursor.fetchone()[0]
        conn.commit()
        cursor.close()
        return id_habilidade_armadura
    except Exception as e:
        conn.rollback()
        print(f"Erro ao criar HabilidadeArmadura: {e}")
        return None

def read_habilidade_armadura(conn, id_habilidade_armadura):
    try:
        cursor = conn.cursor()
        cursor.execute("SELECT * FROM HabilidadeArmadura WHERE IdHabilidadeArmadura = %s;", (id_habilidade_armadura,))
        result = cursor.fetchone()
        cursor.close()
        if result:
            habilidade_armadura = HabilidadeArmadura(*result)
            return habilidade_armadura
        else:
            print("HabilidadeArmadura não encontrada.")
            return None
    except Exception as e:
        print(f"Erro ao ler HabilidadeArmadura: {e}")
        return None

def read_all_habilidades_armadura(conn):
    try:
        cursor = conn.cursor()
        cursor.execute("SELECT * FROM HabilidadeArmadura;")
        results = cursor.fetchall()
        cursor.close()
        habilidades_armadura = [HabilidadeArmadura(*result) for result in results]
        return habilidades_armadura
    except Exception as e:
        print(f"Erro ao ler todas as HabilidadesArmadura: {e}")
        return None

def update_habilidade_armadura(conn, habilidade_armadura):
    try:
        cursor = conn.cursor()
        cursor.execute("UPDATE HabilidadeArmadura SET Armadura = %s, Habilidade = %s "
                       "WHERE IdHabilidadeArmadura = %s;",
                       (habilidade_armadura.armadura, habilidade_armadura.habilidade, habilidade_armadura.id_habilidade_armadura))
        conn.commit()
        cursor.close()
        print("HabilidadeArmadura atualizada com sucesso.")
    except Exception as e:
        conn.rollback()
        print(f"Erro ao atualizar HabilidadeArmadura: {e}")

def delete_habilidade_armadura(conn, id_habilidade_armadura):
    try:
        cursor = conn.cursor()
        cursor.execute("DELETE FROM HabilidadeArmadura WHERE IdHabilidadeArmadura = %s;", (id_habilidade_armadura,))
        conn.commit()
        cursor.close()
        print("HabilidadeArmadura excluída com sucesso.")
    except Exception as e:
        conn.rollback()
        print(f"Erro ao excluir HabilidadeArmadura: {e}")

def update_regiao_PC(conn, id_player, id_regiao):
    try:
        cursor = conn.cursor()
        cursor.execute("UPDATE PC SET Regiao = %s WHERE IdPlayer = %s;", (id_regiao, id_player))
        conn.commit()
        cursor.close()
        print("Região do Player atualizada com sucesso.")
    except Exception as e:
        conn.rollback()
        print(f"Erro ao atualizar Região do Player: {e}")

def read_regiao_PC(conn, id_player):
    try:
        pc=read_pc(conn,id_player)

        regiao=read_regiao(conn,pc.regiao)

        return(regiao)
        
    except Exception as e:
        conn.rollback()
        print(f"Erro ao Obter Região do Player: {e}")


def get_dinheiro_player(conn, id_player):
    try:
        cursor = conn.cursor()
        cursor.execute("SELECT Dinheiro FROM pc WHERE IdPlayer = %s;", (id_player,))
        result = cursor.fetchone()
        cursor.close()
        if result:
            return result[0]
        else:
            print("Player não encontrado.")
            return None
    except Exception as e:
        print(f"Erro ao ler Player: {e}")
        return None
    
def get_nome_player(conn, id_player):
    try:
        cursor = conn.cursor()
        cursor.execute("SELECT Nome FROM pc WHERE IdPlayer = %s;", (id_player,))
        result = cursor.fetchone()
        cursor.close()
        if result:
            return result[0]
        else:
            print("Player não encontrado.")
            return None
    except Exception as e:
        print(f"Erro ao ler Player: {e}")
        return None
    
def get_nome_npc(conn, id_npc):
    try:
        cursor = conn.cursor()
        cursor.execute("SELECT nome FROM npc WHERE idnpc = %s;", (id_npc,))
        result = cursor.fetchone()
        cursor.close()
        if result:
            return result[0]
        else:
            print("NPC não encontrado.")
            return None
    except Exception as e:
        print(f"Erro ao ler NPC: {e}")
        return None
    
def get_nome_mapa(conn, idmapa):
    try:
        cursor = conn.cursor()
        cursor.execute("SELECT nome FROM mapa WHERE idmapa = %s;", (idmapa,))
        result = cursor.fetchone()
        cursor.close()
        if result:
            return result[0]
        else:
            print("Mapa não encontrado.")
            return None
    except Exception as e:
        print(f"Erro ao ler Mapa: {e}")
        return None
    
def get_nome_regiao(conn, idregiao):
    try:
        cursor = conn.cursor()
        cursor.execute("SELECT nome FROM regiao WHERE idregiao = %s;", (idregiao,))
        result = cursor.fetchone()
        cursor.close()
        if result:
            return result[0]
        else:
            print("Região não encontrada.")
            return None
    except Exception as e:
        print(f"Erro ao ler Região: {e}")
        return None      

def get_nome_ferreiro(conn):
    try:
        cursor = conn.cursor()
        cursor.execute("SELECT NPC.Nome AS NomeFerreiro FROM NPC JOIN Forja ON NPC.IdNPC = Forja.NPC WHERE NPC.IdNPC = 2;")
        result = cursor.fetchone()
        cursor.close()
        if result:
            return result[0]
        else:
            print("Ferreiro não encontrado.")
            return None
    except Exception as e:
        print(f"Erro ao obter o nome do Ferreiro: {e}")
        return None
    
def get_fala_ferreiro(conn):
    try:
        cursor = conn.cursor()
        cursor.execute("SELECT F.Fala FROM Forja AS FJ JOIN NPC AS N ON FJ.NPC = N.IdNPC JOIN Fala AS F ON N.IdNPC = F.NPC WHERE FJ.IdForja = 1;")
        result = cursor.fetchone()
        cursor.close()
        if result:
            return result[0]
        else:
            print("Fala do Ferreiro não encontrada.")
            return None
    except Exception as e:
        print(f"Erro ao obter a Fala do Ferreiro: {e}")
        return None
    
def get_nome_arma(conn, idArma):
    try:
        cursor = conn.cursor()
        cursor.execute("SELECT Nome FROM Arma WHERE IdArma = %s;", (idArma,))
        result = cursor.fetchone()
        cursor.close()
        if result:
            return result[0]
        else:
            print("Nome da Arma não encontrada.")
            return None
    except Exception as e:
        print(f"Erro ao obter a Nome da Arma: {e}")
        return None

def get_nome_armadura(conn, idArmadura):
    try:
        cursor = conn.cursor()
        cursor.execute("SELECT Nome FROM Armadura WHERE IdArmadura = %s;", (idArmadura,))
        result = cursor.fetchone()
        cursor.close()
        if result:
            return result[0]
        else:
            print("Nome da Armadura não encontrada.")
            return None
    except Exception as e:
        print(f"Erro ao obter a Nome da Armadura: {e}")
        return None
        
def get_nome_armas(conn):
    try:
        cursor = conn.cursor()
        cursor.execute("SELECT A.nome, A.custocompra, A.IdArma, A.Ataque FROM vendeequipamento V JOIN Equipamento E ON V.equipamento = E.idequipamento JOIN Arma A ON E.idequipamento = A.idarma;")
        results = cursor.fetchall()
        cursor.close()
        
        # Retorna uma lista de tuplas (nome, custocompra)
        return results
    except Exception as e:
        print(f"Erro ao ler todas as Armas: {e}")
        return None

def get_nome_amuletos(conn):
    try:
        cursor = conn.cursor()
        cursor.execute("SELECT A.nome, A.custocompra, A.IdAmuleto, A.Melhoria FROM vendeequipamento V JOIN Equipamento E ON V.equipamento = E.idequipamento JOIN Amuleto A ON E.idequipamento = A.idamuleto;")
        results = cursor.fetchall()
        cursor.close()
        
        # Retorna uma lista de tuplas (nome, custocompra)
        return results
    except Exception as e:
        print(f"Erro ao ler todas as Armas: {e}")
        return None

def get_nome_Ferramentas(conn):
    try:
        cursor = conn.cursor()
        cursor.execute("SELECT A.nome, A.custocompra, A.IdFerramenta, A.Raridade FROM vendeequipamento V JOIN Equipamento E ON V.equipamento = E.idequipamento JOIN Ferramenta A ON E.idequipamento = A.idferramenta;")
        results = cursor.fetchall()
        cursor.close()
        return results
    except Exception as e:
        print(f"Erro ao ler todas as Armas: {e}")
        return None
    
def cria_inventario(conn, pcId):
    try:
        cursor = conn.cursor()
        cursor.execute("INSERT INTO Inventario (PC) VALUES (%s) RETURNING IdInventario;", (pcId,))
        id_inventario = cursor.fetchone()[0]
        conn.commit()
        cursor.close()
        return id_inventario
    except Exception as e:
        conn.rollback()
        print(f"Erro ao criar Inventario: {e}")
        return None
    
def update_dinheiro_player(conn, pcId, dinheiroNovo):
    try:
        cursor = conn.cursor()
        cursor.execute("UPDATE PC SET Dinheiro = %s WHERE IdPlayer = %s;", (dinheiroNovo, pcId))
        conn.commit()
        cursor.close()
        print("Dinheiro do Player atualizado com sucesso.")
    except Exception as e:
        conn.rollback()
        print(f"Erro ao atualizar Dinheiro do Player: {e}")

def get_inventario(conn, pcId):
    try:
        cursor = conn.cursor()
        cursor.execute("SELECT IdInventario FROM Inventario WHERE PC = %s;", (pcId,))
        result = cursor.fetchone()
        cursor.close()
        if result:
            return result[0]
        else:
            print("Inventario não encontrado.")
            return None
    except Exception as e:
        print(f"Erro ao ler Inventario: {e}")
        return None

def insert_guarda_item(conn, idInventario, idItem):
    try:
        cursor = conn.cursor()
        cursor.execute("INSERT INTO GuardaItem (Inventario, Item) VALUES (%s, %s);", (idInventario, idItem))
        conn.commit()
        cursor.close()
        print("GuardaItem inserido com sucesso.")
    except Exception as e:
        conn.rollback()
        print(f"Erro ao inserir GuardaItem: {e}")

def update_afinidade_player(conn, idPc, AfinidadeNova):
    try:
        cursor = conn.cursor()
        cursor.execute("UPDATE PC SET Afinidade = %s WHERE IdPlayer = %s;", (AfinidadeNova, idPc))
        conn.commit()
        cursor.close()
        print("Afinidade do Player atualizada com sucesso.")
    except Exception as e:
        conn.rollback()
        print(f"Erro ao atualizar Afinidade do Player: {e}")

def update_vida_player(conn, idPc, vidaNova):
    try:
        cursor = conn.cursor()
        cursor.execute("UPDATE PC SET Vida = %s WHERE IdPlayer = %s;", (vidaNova, idPc))
        conn.commit()
        cursor.close()
        print("Vida do Player atualizada com sucesso.")
    except Exception as e:
        conn.rollback()
        print(f"Erro ao atualizar Vida do Player: {e}")

def update_ranque_player(conn, idPc, ranqueNovo):
    try:
        cursor = conn.cursor()
        cursor.execute("UPDATE PC SET Ranque = %s WHERE IdPlayer = %s;", (ranqueNovo, idPc))
        conn.commit()
        cursor.close()
        print("Ranque do Player atualizada com sucesso.")
    except Exception as e:
        conn.rollback()
        print(f"Erro ao atualizar Ranque do Player: {e}")


def get_afinidade_player(conn, pcId):
    try:
        cursor = conn.cursor()
        cursor.execute("SELECT Afinidade FROM PC WHERE IdPlayer = %s;", (pcId,))
        result = cursor.fetchone()
        cursor.close()
        if result:
            return result[0]
        else:
            print("Player não encontrado.")
            return None
    except Exception as e:
        print(f"Erro ao ler Player: {e}")
        return None

def get_vida_player(conn, pcId):
    try:
        cursor = conn.cursor()
        cursor.execute("SELECT Vida FROM PC WHERE IdPlayer = %s;", (pcId,))
        result = cursor.fetchone()
        cursor.close()
        if result:
            return result[0]
        else:
            print("Player não encontrado.")
            return None
    except Exception as e:
        print(f"Erro ao ler Player: {e}")
        return None
    
def get_ranque_player(conn, pcId):
    try:
        cursor = conn.cursor()
        cursor.execute("SELECT Ranque FROM PC WHERE IdPlayer = %s;", (pcId,))
        result = cursor.fetchone()
        cursor.close()
        if result:
            return result[0]
        else:
            print("Player não encontrado.")
            return None
    except Exception as e:
        print(f"Erro ao ler Player: {e}")
        return None


def adicionaItemAoInventario(conn, p_nome_funcao, p_id_player):
    try:
        # Criar um cursor
        cursor = conn.cursor()

        # Encontrar o ID do Item
        select_item_query = """
            SELECT IdItem
            FROM Item
            WHERE Funcao = %s
            ORDER BY Raridade, CustoCompra
            LIMIT 1;
        """
        cursor.execute(select_item_query, (p_nome_funcao,))
        v_id_item = cursor.fetchone()

        if v_id_item:
            v_id_item = v_id_item[0]

            # Encontrar o ID do Inventario do jogador
            select_inventario_query = """
                SELECT IdInventario
                FROM Inventario
                WHERE PC = %s
                LIMIT 1;
            """
            cursor.execute(select_inventario_query, (p_id_player,))
            v_id_inventario = cursor.fetchone()

            if v_id_inventario:
                v_id_inventario = v_id_inventario[0]

                # Adicionar o item em UtilizaItem
                insert_utilizaitem_query = """
                    INSERT INTO UtilizaItem (PC, Item)
                    VALUES (%s, %s);
                """
                cursor.execute(insert_utilizaitem_query, (p_id_player, v_id_item))

                # Adicionar o item em GuardaItem
                insert_guardaitem_query = """
                    INSERT INTO GuardaItem (Inventario, Item, Quantidade)
                    VALUES (%s, %s, 1);
                """
                cursor.execute(insert_guardaitem_query, (v_id_inventario, v_id_item))

                # Commit das transações
                conn.commit()
                print("Item adicionado ao inventário com sucesso.")
            else:
                print("Inventário do jogador não encontrado.")
        else:
            print("Item não encontrado.")

    except (Exception, psycopg2.Error) as error:
        print(f"Erro ao adicionar item ao inventário: {error}")


def obter_itens_da_loja(conn, id_loja):
    try:
        # Criar um cursor
        cursor = conn.cursor()

        # Executar a consulta SQL
        consulta_sql = """
            SELECT I.*
            FROM VendeItem VI
            JOIN Item I ON VI.Item = I.IdItem
            WHERE VI.Loja = %s;
        """

        cursor.execute(consulta_sql, (id_loja,))

        # Obter os resultados
        resultados = cursor.fetchall()

        itens = [Item(*result) for result in resultados]
        return itens

    except (Exception, psycopg2.Error) as error:
        print(f"Erro ao obter itens da loja: {error}")

    finally:
        # Fechar o cursor
        if cursor:
            cursor.close()

def obter_dados_missoes(conn, id_missao, id_player):
    try:
        # Criar um cursor
        cursor = conn.cursor()

        # Consulta SQL para obter os dados desejados
        consulta_sql = """
            SELECT 
                RE.Quantidade || ' / ' || EM.Quantidade || ' - ' || M.Nome
            FROM 
                RealizaEtapa RE
            JOIN EtapaMonstro EM ON RE.EtapaMissao = EM.IdEtapaMonstro
            JOIN Monstro M ON EM.Monstro = M.IdMonstro
            WHERE 
                EM.Missao = %s AND RE.PC = %s;
        """

        cursor.execute(consulta_sql, (id_missao, id_player))

        # Obter os resultados
        resultados = cursor.fetchall()

        return resultados

    except (Exception, psycopg2.Error) as error:
        print(f"Erro ao obter dados da missão: {error}")

    finally:
        # Fechar o cursor
        if cursor:
            cursor.close()


def obterItensConsumidos(conn, idItemPrincipal):
    try:
        cursor = conn.cursor()

        # Obter os itens consumidos
        query = """
            SELECT CI.Quantidade, I.Nome
            FROM CriaItem CI
            JOIN Item I ON CI.ItemConsumido = I.IdItem
            WHERE CI.Item = %s;
        """

        cursor.execute(query, (idItemPrincipal,))
        resultados = cursor.fetchall()

        itens_consumidos = ["{} x {}".format(quantidade, nome) for quantidade, nome in resultados]

        return itens_consumidos

    except (Exception, psycopg2.Error) as error:
        print(f"Erro ao obter itens consumidos: {error}")
        return []

    finally:
        if cursor:
            cursor.close()

def atualiza_quantidade_realiza_etapa(conn, id_monstro, id_pc):
    try:
        with conn.cursor() as cursor:
            # Verifica se existe uma entrada para o monstro na tabela EtapaMonstro
            cursor.execute("SELECT IdEtapaMonstro FROM EtapaMonstro WHERE Monstro = %s", (id_monstro,))
            etapa_monstro = cursor.fetchone()

            if etapa_monstro:
                id_etapa_monstro = etapa_monstro[0]

                # Atualiza a quantidade na tabela RealizaEtapa
                cursor.execute("UPDATE RealizaEtapa SET Quantidade = Quantidade + 1 WHERE EtapaMissao = %s AND PC = %s", (id_etapa_monstro, id_pc))
            else:
                print("Não existe uma entrada correspondente na tabela EtapaMonstro para o monstro com ID:", id_monstro)

        # Commit da transação
        conn.commit()

    except psycopg2.Error as e:
        print("Erro ao executar a operação:", e)


def verifica_quantidades_e_atualiza_status_e_pc(conn, id_pc):
    try:
        with conn.cursor() as cursor:
            # Verifica se existe uma entrada correspondente na tabela RealizaMissao
            cursor.execute("SELECT rm.IdRealizaMissao, em.Quantidade, re.Quantidade, m.Premio, pc.Regiao, pc.Dinheiro "
                           "FROM RealizaMissao rm "
                           "JOIN EtapaMonstro em ON rm.Missao = em.Missao AND rm.PC = %s "
                           "JOIN RealizaEtapa re ON em.IdEtapaMonstro = re.EtapaMissao AND re.PC = %s "
                           "JOIN Missao m ON rm.Missao = m.IdMissao "
                           "JOIN PC pc ON rm.PC = pc.IdPlayer "
                           "WHERE em.Quantidade = re.Quantidade", (id_pc, id_pc))
            resultado = cursor.fetchone()

            if resultado:
                id_realiza_missao, _, _, premio, regiao, dinheiro = resultado

                # Atualiza o status na tabela RealizaMissao para 5
                cursor.execute("UPDATE RealizaMissao SET Status = 5 WHERE IdRealizaMissao = %s", (id_realiza_missao,))

                # Atualiza a região do PC para 1
                cursor.execute("UPDATE PC SET Regiao = 1 WHERE IdPlayer = %s", (id_pc,))

                # Adiciona o prêmio da missão ao dinheiro do PC
                novo_dinheiro = dinheiro + premio
                cursor.execute("UPDATE PC SET Dinheiro = %s WHERE IdPlayer = %s", (novo_dinheiro, id_pc))
                return 1
            else:
                print("Não há quantidades iguais entre RealizaEtapa e EtapaMonstro para o PC com ID:", id_pc)
                return 0

        # Commit da transação
        conn.commit()

    except psycopg2.Error as e:
        print("Erro ao executar a operação:", e)

def calcular_dano_e_atualizar_vida(conn, id_player, id_monster):
    # Conectar ao banco de dados
    cursor = conn.cursor()

    # Obter a soma das defesas de todas as armaduras do jogador
    cursor.execute("""
        SELECT COALESCE(SUM(a.Defesa), 0) AS DefesaTotal
        FROM UtilizaItem ui
        JOIN Armadura a ON ui.Item = a.IdArmadura
        WHERE ui.PC = %s
    """, (id_player,))

    defesa_total = cursor.fetchone()[0]

    # Obter o ataque do monstro
    cursor.execute("SELECT Ataque FROM Monstro WHERE IdMonstro = %s"%(id_monster,))
    ataque_monstro = cursor.fetchone()[0]

    # Obter a vida atual e o valor máximo da vida do jogador
    cursor.execute("SELECT VidaAtual, Vida FROM PC WHERE IdPlayer = %s", (id_player,))
    vida_atual, vida_maxima = cursor.fetchone()

    # Calcular o dano (aleatoriamente defesa ou 0)
    dano = max(0, random.choice([0, defesa_total]))

    # Calcular o dano total do monstro (ataque - defesa)
    dano_total_monstro = max(0, ataque_monstro - dano)

    # Atualizar a vida do jogador
    nova_vida = max(0, vida_atual - dano_total_monstro)

    # Verificar se a vida atingiu zero e, se sim, restaurar para o valor máximo
    morreu=0
    if nova_vida == 0:
        nova_vida = vida_maxima
        morreu=1

    cursor.execute("UPDATE PC SET VidaAtual = %s WHERE IdPlayer = %s", (nova_vida, id_player))

    # Commit das alterações
    conn.commit()

    # Fechar a conexão
    cursor.close()

    # Retornar 0 se a vida do jogador chegou a 0, ou 1 se não
    return morreu

def verifica_quantidade_item(conn, jogador_id, item_id, quantidade_verificar):
    try:
        with conn.cursor() as cursor:
            # Verifica se o jogador e o item existem
            cursor.execute("SELECT 1 FROM PC WHERE IdPlayer = %s", (jogador_id,))
            if not cursor.fetchone():
                raise ValueError(f"Jogador não encontrado: {jogador_id}")

            cursor.execute("SELECT 1 FROM Item WHERE IdItem = %s", (item_id,))
            if not cursor.fetchone():
                raise ValueError(f"Item não encontrado: {item_id}")

            # Obtém a quantidade atual do item no inventário do jogador
            query = sql.SQL("""
                SELECT COALESCE(SUM(Quantidade), 0)
                FROM GuardaItem
                WHERE Inventario IN (SELECT IdInventario FROM Inventario WHERE PC = %s)
                    AND Item = %s
            """)
            cursor.execute(query, (jogador_id, item_id))
            quantidade_atual = cursor.fetchone()[0]

            # Retorna verdadeiro se a quantidade for maior ou igual à quantidade desejada
            return quantidade_atual >= quantidade_verificar

    except Exception as e:
        print("Erro ao executar a operação:", e)

def subtrai_quantidade_item(conn, jogador_id, item_id, quantidade_subtrair):
    try:
        with conn.cursor() as cursor:
            # Verifica se o jogador e o item existem
            cursor.execute("SELECT 1 FROM PC WHERE IdPlayer = %s", (jogador_id,))
            if not cursor.fetchone():
                raise ValueError(f"Jogador não encontrado: {jogador_id}")

            cursor.execute("SELECT 1 FROM Item WHERE IdItem = %s", (item_id,))
            if not cursor.fetchone():
                raise ValueError(f"Item não encontrado: {item_id}")

            # Obtém a quantidade atual do item no inventário do jogador
            query_quantidade_atual = sql.SQL("""
                SELECT Quantidade
                FROM GuardaItem
                WHERE Inventario IN (SELECT IdInventario FROM Inventario WHERE PC = %s)
                    AND Item = %s
            """)
            cursor.execute(query_quantidade_atual, (jogador_id, item_id))
            quantidade_atual = cursor.fetchone()

            if quantidade_atual is not None:
                quantidade_atual = quantidade_atual[0]

                # Subtrai a quantidade desejada
                nova_quantidade = quantidade_atual - quantidade_subtrair

                # Atualiza a quantidade no inventário
                if nova_quantidade > 0:
                    query_atualiza_quantidade = sql.SQL("""
                        UPDATE GuardaItem
                        SET Quantidade = %s
                        WHERE Inventario IN (SELECT IdInventario FROM Inventario WHERE PC = %s)
                            AND Item = %s
                    """)
                    cursor.execute(query_atualiza_quantidade, (nova_quantidade, jogador_id, item_id))
                else:
                    # Se a quantidade for menor ou igual a zero, exclui o registro
                    query_exclui_registro = sql.SQL("""
                        DELETE FROM GuardaItem
                        WHERE Inventario IN (SELECT IdInventario FROM Inventario WHERE PC = %s)
                            AND Item = %s
                    """)
                    cursor.execute(query_exclui_registro, (jogador_id, item_id))

                conn.commit()
                return True

            else:
                print(f"Item não encontrado no inventário do jogador: {jogador_id}")
                return False

    except Exception as e:
        print(f"Erro ao subtrair a quantidade do item: {e}")
        return False