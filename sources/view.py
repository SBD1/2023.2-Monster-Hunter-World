from model import *
from controller import *
from flask import render_template, request

def pageCriarPersonagem():
    page={
        "name":"Crie seu personagem",
        "background":"mainBackground.jpg",
        "content":[
            {
                "type":"input",
                "text":"Nome:",
                "name":"nome"           
            },
            {
                "type":"options",
                "text":"Arma:",
                "name":"arma",
                "options":[
                    {
                        "text":"Espadão",
                        "value":"espadao"
                    },
                    {
                        "text":"Espada Longa",
                        "value":"espadaLonga"
                    },
                    {
                        "text":"Martelo",
                        "value":"martelo"
                    },
                    {
                        "text":"Lança",
                        "value":"lanca"
                    }
                ]      
            },
            {
                "type":"options",
                "text":"Genero:",
                "name":"genero",
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
            {
                "type":"input",
                "text":"Nome do Amigato:",
                "name":"amigato"           
            },
            {
                "type":"button",
                "text":"Confirmar",
                "name":"personagem",
                "action":"criarPersonagem"           
            },
        ]
    }
    return render_template('index.html',page=page)

def pageListaPersonagem(pcList):
    contentList=[]
    for pc in pcList:
        contentList.append({
            "type":"button",
            "text":"Nome: "+str(pc.nome)+" - Ranque: "+str(pc.ranque)+" - Genero: "+str(pc.genero),
            "name":str(pc.nome)+str(pc.ranque)+str(pc.genero),
            "action":"regiao/"+str(pc.id_player)
        })
    contentList.append({
                "type":"button",
                "text":"Criar Personagem",
                "name":"personagem",
                "action":"criarPersonagem"           
            })
    page={
        "name":"Escolha seu personagem",
        "background":"mainBackground.jpg",
        "content":contentList
    }
    return render_template('index.html',page=page)
    
def pageTutorial(npc, pcId, regiao, falas, firstTime):
    content=[]
    content.append({
                "type": "text",
                "text": "%s:"%(npc.nome)
            })
    for fala in falas:
        content.append({
                "type": "text",
                "text": "%s"%(fala.fala)
            })

    content.append({
        "type": "button",
        "text": "Iniciar jornada" if firstTime else "Voltar",
        "action": "regiao/{}".format(pcId)
    })

    page = {
        "name": regiao.nome,
        "background": "tutorialBackground.png",
        "content":content
    }
    return render_template('index.html', page=page)

def pageAssistente(pcId,npc,falas,missoes):
    content = []

    for fala in falas:
        content.append({
            
            "type": "text",
            "text": fala.fala
            
        })

    for missao in missoes:
        content.append({
            "type": "button",
            "text": "%s - Nível: %s"%(missao.nome,missao.nivel),
            "action": "missao/{}-{}-{}".format(pcId,npc.id_npc,missao.id_missao)
        })

    content.append({
            "type": "button",
            "text": "voltar",
            "action": "regiao/{}".format(pcId)
        })

    page = {
        "name": npc.nome,
        "background": "mainBackground.jpg",
        "content":content  
    }

    return render_template('index.html', page=page)

def pageAssistenteMissao(pcId,npc,falas,missao):
    content = []

    for fala in falas:
        content.append({
            
            "type": "text",
            "text": fala.fala
            
        })

    content.append({
        "type": "button",
        "text": "Sair da missao",
        "action": "cancelaMissao/{}-{}".format(pcId,missao.id_missao)
    })

    content.append({
            "type": "button",
            "text": "voltar",
            "action": "regiao/{}".format(pcId)
        })

    page = {
        "name": npc.nome,
        "background": "mainBackground.jpg",
        "content":content  
    }

    return render_template('index.html', page=page)

def pageMonstro(monstro,instancia_monstro,pc):
    content = []

    content.append(
    {
        "type": "text",
        "text": "Vida do monstro: %s/%s"%(instancia_monstro.vida,monstro.vida)
    })

    content.append(
    {
        "type": "text",
        "text": "Sua vida: %s/%s"%(pc.vidaAtual,pc.vida)
    })

    content.append({
        "type": "button",
        "text": "Atacar",
        "action": "atacaMonstro/{}-{}-{}".format(pc.id_player,monstro.id_monstro, instancia_monstro.id_instancia_monstro)
    })

    content.append({
        "type": "button",
        "text": "Voltar",
        "action": "regiao/{}".format(pc.id_player)
    })

    page = {
        "name": monstro.nome,
        "background": "mainBackground.jpg",
        "content":content  
    }

    return render_template('index.html', page=page)

def pageMissao(pcId, npcId, missao, mapa):
    content = []

    content.append({
        "type":"text",
        "text":"Mapa: %s"%(mapa.nome)
        })

    content.append({
        "type":"text",
        "text":"Cliente: %s"%(missao.cliente)
        })

    content.append({
        "type":"text",
        "text":"Descricao: %s"%(missao.descricao)
        })

    content.append({
        "type":"text",
        "text":"Premio: %s z"%(missao.premio)
        })

    content.append({
        "type":"text",
        "text":"Máximo de desmaios: %s"%(missao.maximo_desmaios)
        })

    content.append({
        "type":"text",
        "text":"Tempo: %s min"%(missao.tempo)
        })

    content.append({
            "type": "button",
            "text": "Aceitar",
            "action": "pegaMissao/{}-{}".format(pcId,missao.id_missao)
        })

    content.append({
            "type": "button",
            "text": "voltar",
            "action": "assistente/{}-{}".format(pcId,npcId)
        })

    page = {
        "name": "Missao: %s"%(missao.nome),
        "background": "mainBackground.jpg",
        "content":content  
    }

    return render_template('index.html', page=page)

def pageRegiao(regiao, leva_em, npcs, monstros, pcId, missoes):
    buttons = []

    for missao in missoes:
        buttons.append({
            "type":"text",
            "text":str(missao[0])
        })

    for npc in npcs:
        buttons.append({
            "type": "button",
            "text": npc.nome,
            "action": "{}/{}-{}".format(npc.funcao,pcId, npc.id_npc)
        })

    for monstro in monstros:
        buttons.append({
            "type": "button",
            "text": monstro.nome,
            "action": "monstros/{}-{}".format(pcId, monstro.id_monstro)
        })

    for regiao in leva_em:
        buttons.append({
            "type": "button",
            "text": regiao.nome,
            "action": "atualizaPCRegiao/{}-{}".format(pcId, regiao.id_regiao)
        })
    

    page = {
        "name": regiao.nome,
        "background": "mainBackground.jpg",
        "content":buttons  
    }

    return render_template('index.html', page=page)
    
def pageForja(nomeFerreiro, pcId,npcId):
    page = {
        "name": "Forja",
        "background": "forja.jpg",
        "content": [
            {
                "type": "text",
                "text": "Bem-vindo à Forja!"
            },
            {
                "type": "text",
                "text": "Eu sou o {}.".format(nomeFerreiro)  
            },
            {
                "type": "text",
                "text": "Transformo metal em armas e armaduras que definirão sua saga épica."
            },
            {
                "type":"text",
                "text":" Então, o que deseja fazer?"
            },
            {
                "type":"button",
                "text":"Forjar Armaduras",
                "action":"forjarArmaduras/{}-{}".format(pcId,npcId)         
            },
            {
                "type":"button",
                "text":"Forjar Armas",
                "action":"forjarArmas/{}-{}".format(pcId,npcId)         
            },
            {
                "type":"button",
                "text":"Voltar",
                "action":"regiao/{}".format(pcId)
            }
        ]
    }
    return render_template('index.html', page=page, nomeFerreiro=nomeFerreiro)

def pageForjarArmas(armas, pcId,npcId):

    content=[]
    content.append(
    {
        "type": "text",
        "text": "Qual arma deseja forjar?"
    })

    for arma in armas:
        content.append({
            "type":"button",
            "text":arma.nome,
            "action":"forja/item/{}-{}-{}".format(pcId,npcId,arma.id_arma)
    })


    content.append({
        "type":"button",
        "text":"Voltar",
        "action":"forja/{}-{}".format(pcId,npcId)
    })

    page = {
        "name": "Forjar Armas",
        "background": "forja.jpg",
        "content": content
    }
    return render_template('index.html', page=page)

def pageForjarArmaduras(armaduras, pcId,npcId):

    content=[]
    content.append(
    {
        "type": "text",
        "text": "Qual armadura deseja forjar?"
    })

    for armadura in armaduras:
        content.append({
            "type":"button",
            "text":armadura.nome,
            "action":"forja/item/{}-{}-{}".format(pcId,npcId,armadura.id_armadura)
    })


    content.append({
        "type":"button",
        "text":"Voltar",
        "action":"forja/{}-{}".format(pcId,npcId)
    })

    page = {
        "name": "Forjar Armaduras",
        "background": "forja.jpg",
        "content": content
    }
    return render_template('index.html', page=page)

def pageLoja(dinheiro_player, pcId,npcId, lojas):
    buttons = []

    for loja in lojas:

        if loja.tipo == 1:
            button_text = "Loja de Itens"
        elif loja.tipo == 2:
            button_text = "Loja de Plantas"
        elif loja.tipo == 3:
            button_text = "Loja de Insetos"
        elif loja.tipo == 4:
            button_text = "Loja de Materiais"
        elif loja.tipo == 5:
            button_text = "Loja de Armaduras"
        elif loja.tipo == 6:
            button_text = "Loja de Armas"
        else:
            button_text = "Loja Desconhecida"
        action = f"loja/{pcId}-{npcId}-{loja.id_loja}"
        buttons.append({
            "type": "button",
            "text": button_text,
            "action": action
        })

    buttons.append({
        "type": "button",
        "text": "Voltar",
        "action": f"regiao/{pcId}"
    })

    page = {
        "name": "Loja",
        "background": "loja.jpg",
        "content": [
            {"type": "text", "text": "Bem-vindo à Loja!"},
            {"type": "text", "text": f"Dinheiro: {dinheiro_player}"},
            {"type": "text", "text": "Aqui você pode comprar equipamentos! O que procura?"},
            *buttons
        ]
    }
    
    return render_template('index.html', page=page, dinheiro_player=dinheiro_player)

def pageLojaItens(dinheiro_player, pcId,npcId, itens):
    buttons = []

    for item in itens:
        action = f"loja/item/{pcId}-{npcId}-{item.id_item}"
        buttons.append({
            "type": "button",
            "text": item.nome,
            "action": action
        })

    buttons.append({
        "type": "button",
        "text": "Voltar",
        "action": f"regiao/{pcId}"
    })

    page = {
        "name": "Loja",
        "background": "loja.jpg",
        "content": [
            {"type": "text", "text": "Bem-vindo à Loja!"},
            {"type": "text", "text": f"Dinheiro: {dinheiro_player}"},
            {"type": "text", "text": "Aqui você pode comprar equipamentos! O que procura?"},
            *buttons
        ]
    }
    
    return render_template('index.html', page=page, dinheiro_player=dinheiro_player)

def pageErroNaCompra(pcId,npcId):
    page={
        "name":"Erro na compra",
        "background":"mainBackground.jpg",
        "content":[
            {
                "type":"text",
                "text":"Você não tem dinheiro suficiente para comprar este equipamento."
            },
            {
                "type":"button",
                "text":"Voltar",
                "action":"loja/{}-{}".format(pcId,npcId)
            }
        ]
    }
    return render_template('index.html',page=page)

def pageSucessoNaCompra(pcId,npcId):
    page={
        "name":"Sucesso na compra",
        "background":"mainBackground.jpg",
        "content":[
            {
                "type":"text",
                "text":"Parabéns! Você comprou este equipamento com sucesso."
            },
            {
                "type":"button",
                "text":"Voltar",
                "action":"loja/{}-{}".format(pcId,npcId)
            }
        ]
    }
    return render_template('index.html',page=page)

def pageErroNaForja(pcId, npcId):
    page = {
        "name": "Erro na compra",
        "background": "mainBackground.jpg",
        "content": [
            {
                "type": "text",
                "text": "Você não tem materiais suficientes para forjar este equipamento."
            },
            {
                "type": "button",
                "text": "Voltar",
                "action": "forja/{}-{}".format(pcId, npcId)
            }
        ]
    }
    return render_template('index.html', page=page)

def pageSucessoNaForja(pcId, npcId):
    page = {
        "name": "Sucesso na compra",
        "background": "mainBackground.jpg",
        "content": [
            {
                "type": "text",
                "text": "Parabéns! Você forjou este equipamento com sucesso."
            },
            {
                "type": "button",
                "text": "Voltar",
                "action": "forja/{}-{}".format(pcId, npcId)
            }
        ]
    }
    return render_template('index.html', page=page)


def pageLojaItem(item, pcId, npcId):
    content = [
        {
            "type": "text",
            "text": "Bem-vindo à loja!"
        },
        {
            "type": "text",
            "text": "Item disponível para compra:"
        },
        {
            "type": "text",
            "text": "Nome: {}".format(item.nome)
        },
        {
            "type": "text",
            "text": "Descrição: {}".format(item.descricao)
        },
        {
            "type": "text",
            "text": "Custo de Compra: {}".format(item.custo_compra)
        },
        {
            "type": "button",
            "text": "Comprar",
            "action": "erroNaCompra/{}-{}".format(pcId, npcId)
        },
        {
            "type": "button",
            "text": "Voltar",
            "action": "loja/{}-{}".format(pcId, npcId)
        }
    ]

    page = {
        "name": "Loja",
        "background": "loja.jpg",
        "content": content
    }
    return render_template('index.html', page=page)

def pageForjaItem(item, pcId, npcId, itens):
    content = [
        {
            "type": "text",
            "text": "Bem-vindo à forja!"
        },
        {
            "type": "text",
            "text": "Item disponível para forja:"
        },
        {
            "type": "text",
            "text": "Nome: {}".format(item.nome)
        },
        {
            "type": "text",
            "text": "Descrição: {}".format(item.descricao)
        },
        {
            "type": "text",
            "text": "Custo de Forja: {}".format(item.custo_compra)
        },
    ]

    for element in itens:
        content.append(
        {
            "type": "text",
            "text": element
        })

    

    content.append(
        {
            "type": "button",
            "text": "Forjar",
            "action": "erroNaForja/{}-{}".format(pcId, npcId)
        })
    content.append({
            "type": "button",
            "text": "Voltar",
            "action": "forja/{}-{}".format(pcId, npcId)
        })
    page = {
        "name": "Forja",
        "background": "forja.jpg",
        "content": content
    }
    return render_template('index.html', page=page)