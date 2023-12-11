class Mapa:
    def __init__(self, id_mapa, nome, descricao):
        self.id_mapa = id_mapa
        self.nome = nome
        self.descricao = descricao

class Regiao:
    def __init__(self, id_regiao, nome, descricao, id_mapa):
        self.id_regiao = id_regiao
        self.nome = nome
        self.descricao = descricao
        self.id_mapa = id_mapa

class LevaEm:
    def __init__(self, regiao_origem, regiao_destino):
        self.regiao_origem = regiao_origem
        self.regiao_destino = regiao_destino

class NPC:
    def __init__(self, id_npc, regiao, nome, descricao, funcao, raca, genero):
        self.id_npc = id_npc
        self.regiao = regiao
        self.nome = nome
        self.descricao = descricao
        self.funcao = funcao
        self.raca = raca
        self.genero = genero

class PC:
    def __init__(self, id_player, regiao, nome, ranque, vida, vidaAtual,vigor, afinidade, dinheiro, genero):
        self.id_player = id_player
        self.regiao = regiao
        self.nome = nome
        self.ranque = ranque
        self.vida = vida
        self.vidaAtual = vidaAtual
        self.vigor = vigor
        self.afinidade = afinidade
        self.dinheiro = dinheiro
        self.genero = genero

class Amigato:
    def __init__(self, id_amigato, regiao, pc, nome, nivel, status, vida):
        self.id_amigato = id_amigato
        self.regiao = regiao
        self.pc = pc
        self.nome = nome
        self.nivel = nivel
        self.status = status
        self.vida = vida

class Fala:
    def __init__(self, id_fala, npc, fala, repetivel,executado):
        self.id_fala = id_fala
        self.npc = npc
        self.fala = fala
        self.repetivel = repetivel
        self.executado = executado
        
class Monstro:
    def __init__(self, id_monstro, nome, elemento, vida, ataque):
        self.id_monstro = id_monstro
        self.nome = nome
        self.elemento = elemento
        self.vida = vida
        self.ataque = ataque

class InstanciaMonstro:
    def __init__(self, id_instancia_monstro, monstro, status, vida):
        self.id_instancia_monstro = id_instancia_monstro
        self.monstro = monstro
        self.status = status
        self.vida = vida

class RegiaoMonstro:
    def __init__(self, id_regiao_monstro, regiao, monstro):
        self.id_regiao_monstro = id_regiao_monstro
        self.regiao = regiao
        self.monstro = monstro

class AtacaMonstro:
    def __init__(self, id_ataca_monstro, pc, monstro, dano, horario):
        self.id_ataca_monstro = id_ataca_monstro
        self.pc = pc
        self.monstro = monstro
        self.dano = dano
        self.horario = horario

class Missao:
    def __init__(self, id_missao, mapa, npc, nome, nivel, tipo, cliente, descricao, maximo_desmaios, tempo, premio, resumo, ranque_minimo):
        self.id_missao = id_missao
        self.mapa = mapa
        self.npc = npc
        self.nome = nome
        self.nivel = nivel
        self.tipo = tipo
        self.cliente = cliente
        self.descricao = descricao
        self.maximo_desmaios = maximo_desmaios
        self.tempo = tempo
        self.premio = premio
        self.resumo = resumo
        self.ranque_minimo = ranque_minimo

class MissaoPreReq:
    def __init__(self, id_missao_prereq, missao_prereq, missao):
        self.id_missao_prereq = id_missao_prereq
        self.missao_prereq = missao_prereq
        self.missao = missao

class EtapaMissao:
    def __init__(self, id_etapa_missao, missao, nome, status, descricao):
        self.id_etapa_missao = id_etapa_missao
        self.missao = missao
        self.nome = nome
        self.status = status
        self.descricao = descricao

class EtapaMonstro:
    def __init__(self, id_etapa_monstro, etapa_missao, monstro, quantidade):
        self.id_etapa_monstro = id_etapa_monstro
        self.etapa_missao = etapa_missao
        self.monstro = monstro
        self.quantidade = quantidade

class EtapaFala:
    def __init__(self, id_etapa_fala, etapa_missao, fala):
        self.id_etapa_fala = id_etapa_fala
        self.etapa_missao = etapa_missao
        self.fala = fala

class RealizaMissao:
    def __init__(self, id_realiza_missao, missao, pc, status):
        self.id_realiza_missao = id_realiza_missao
        self.missao = missao
        self.pc = pc
        self.status = status

class Inventario:
    def __init__(self, id_inventario, pc, capacidade_maxima):
        self.id_inventario = id_inventario
        self.pc = pc
        self.capacidade_maxima = capacidade_maxima

class Forja:
    def __init__(self, id_forja, npc, tipo):
        self.id_forja = id_forja
        self.npc = npc
        self.tipo = tipo

class Loja:
    def __init__(self, id_loja, npc, tipo):
        self.id_loja = id_loja
        self.npc = npc
        self.tipo = tipo

class Equipamento:
    def __init__(self, id_equipamento, categoria):
        self.id_equipamento = id_equipamento
        self.categoria = categoria

class UtilizaEquipamento:
    def __init__(self, pc, equipamento):
        self.pc = pc
        self.equipamento = equipamento

class GuardaEquipamento:
    def __init__(self, inventario, equipamento):
        self.inventario = inventario
        self.equipamento = equipamento

class CriaEquipamento:
    def __init__(self, forja, equipamento):
        self.forja = forja
        self.equipamento = equipamento

class VendeEquipamento:
    def __init__(self, loja, equipamento):
        self.loja = loja
        self.equipamento = equipamento

class AmigatoEquipamento:
    def __init__(self, amigato, equipamento):
        self.amigato = amigato
        self.equipamento = equipamento

class Item:
    def __init__(self, id_item, nome, raridade, tipo, funcao, descricao, valor_venda, custo_compra):
        self.id_item = id_item
        self.nome = nome
        self.raridade = raridade
        self.tipo = tipo
        self.funcao = funcao
        self.descricao = descricao
        self.valor_venda = valor_venda
        self.custo_compra = custo_compra

class DropaItem:
    def __init__(self, id_dropa_item, monstro, item):
        self.id_dropa_item = id_dropa_item
        self.monstro = monstro
        self.item = item

class Arma:
    def __init__(self, id_arma, nome, raridade, custo_compra, valor_venda, descricao, tipo, ataque, afiacao, elemento, valor_elemento):
        self.id_arma = id_arma
        self.nome = nome
        self.raridade = raridade
        self.custo_compra = custo_compra
        self.valor_venda = valor_venda
        self.descricao = descricao
        self.tipo = tipo
        self.ataque = ataque
        self.afiacao = afiacao
        self.elemento = elemento
        self.valor_elemento = valor_elemento

class Armadura:
    def __init__(self, id_armadura, nome, raridade, custo_compra, valor_venda, descricao, tipo, defesa, fogo, agua, raio, gelo, dragao):
        self.id_armadura = id_armadura
        self.nome = nome
        self.raridade = raridade
        self.custo_compra = custo_compra
        self.valor_venda = valor_venda
        self.descricao = descricao
        self.tipo = tipo
        self.defesa = defesa
        self.fogo = fogo
        self.agua = agua
        self.raio = raio
        self.gelo = gelo
        self.dragao = dragao

class Amuleto:
    def __init__(self, id_amuleto, nome, nivel, raridade, custo_compra, valor_venda, descricao, tipo, melhoria):
        self.id_amuleto = id_amuleto
        self.nome = nome
        self.nivel = nivel
        self.raridade = raridade
        self.custo_compra = custo_compra
        self.valor_venda = valor_venda
        self.descricao = descricao
        self.tipo = tipo
        self.melhoria = melhoria

class Ferramenta:
    def __init__(self, id_ferramenta, nome, nivel, raridade, custo_compra, valor_venda, descricao, tipo, funcao, tempo_efeito, tempo_recarga):
        self.id_ferramenta = id_ferramenta
        self.nome = nome
        self.nivel = nivel
        self.raridade = raridade
        self.custo_compra = custo_compra
        self.valor_venda = valor_venda
        self.descricao = descricao
        self.tipo = tipo
        self.funcao = funcao
        self.tempo_efeito = tempo_efeito
        self.tempo_recarga = tempo_recarga

class Habilidade:
    def __init__(self, id_habilidade, nome, nivel, descricao, funcao):
        self.id_habilidade = id_habilidade
        self.nome = nome
        self.nivel = nivel
        self.descricao = descricao
        self.funcao = funcao

class HabilidadeAmuleto:
    def __init__(self, id_habilidade_amuleto, amuleto, habilidade):
        self.id_habilidade_amuleto = id_habilidade_amuleto
        self.amuleto = amuleto
        self.habilidade = habilidade

class HabilidadeArmadura:
    def __init__(self, id_habilidade_armadura, armadura, habilidade):
        self.id_habilidade_armadura = id_habilidade_armadura
        self.armadura = armadura
        self.habilidade = habilidade