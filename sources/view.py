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
                        "value":"espada_longa"
                    },
                    {
                        "text":"Espada e Escudo",
                        "value":"espada_escudo"
                    },
                    {
                        "text":"Duplas-lâminas",
                        "value":"duplas_laminas"
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

def pageRegiao(regiao, leva_em, npcs, monstros, pcId):
    buttons = []

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
    
def pageForja(nomeFerreiro, pcId):
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
                "text":"Forjar Equipamento",
                "action":"retornaForjarEquipamento/{}".format(pcId)         
            },
            {
                "type":"button",
                "text":"Voltar",
                "action":"regiao/{}".format(pcId)
            }
        ]
    }
    return render_template('index.html', page=page, nomeFerreiro=nomeFerreiro)

def pageForjarEquipamento(falaFerreiro, pcId):
    page = {
        "name": "Forjar Equipamento",
        "background": "forja.jpg",
        "content": [
            {
                "type": "text",
                "text": "{}".format(falaFerreiro) 
            },
            {
                "type":"button",
                "text":"Armas",
                "action":"retornaForjarArmas/{}".format(pcId)         
            },
            {
                "type":"button",
                "text":"Armaduras",
                "action":"retornaForjarArmaduras/{}".format(pcId)         
            },
            {
                "type":"button",
                "text":"Voltar",
                "action":"retornaForja/{}".format(pcId)
            }
        ]
    }
    return render_template('index.html', page=page, falaFerreiro=falaFerreiro)

def pageForjarArmas(nomeArma7, nomeArma9, nomeArma10, nomeArma11, pcId):
    page = {
        "name": "Forjar Armas",
        "background": "forja.jpg",
        "content": [
            {
                "type": "text",
                "text": "Qual arma deseja forjar?"
            },
            {
                "type":"options",
                "text":"Armas:",
                "name":"arma",
                "options":[
                    {
                        "text":"{}".format(nomeArma7),
                        "value":""
                    },
                    {
                        "text":"{}".format(nomeArma9),
                        "value":""
                    },
                    {
                        "text":"{}".format(nomeArma10),
                        "value":""
                    },
                    {
                        "text":"{}".format(nomeArma11),
                        "value":""
                    },
                ]      
            },
            {
                "type":"button",
                "text":"Vizualizar",
                "name":"arma",
                "action": "visualizarArma/{}".format(pcId)          
            },
            {
                "type":"button",
                "text":"Voltar",
                "action":"retornaForjarEquipamento/{}".format(pcId)
            }
        ]
    }
    return render_template('index.html', page=page, nomeArma7=nomeArma7, nomeArma9=nomeArma9, nomeArma10=nomeArma10, nomeArma11=nomeArma11)

def pageForjarArmaduras(nomeArmadura14, nomeArmadura16, pcId):
    page = {
        "name": "Forjar Armaduras",
        "background": "forja.jpg",
        "content": [
            {
                "type": "text",
                "text": "Qual armadura deseja forjar?"
            },
            {
                "type":"button",
                "text":"{}".format(nomeArmadura14),
                "action":"retornaForjarLançaFerro/{}".format(pcId)         
            },
            {
                "type":"button",
                "text":"{}".format(nomeArmadura16),
                "action":"retornaForjarLançaFerro/{}".format(pcId)         
            },
            {
                "type":"button",
                "text":"Voltar",
                "action":"retornaForjarEquipamento/{}".format(pcId)
            }
        ]
    }
    return render_template('index.html', page=page, nomeArmadura14=nomeArmadura14, nomeArmadura16=nomeArmadura16)

def pageLojaVendeArmas(pcId, armas):
    buttons = [
    {
        "type": "button",
        "text": "{} (Custo: $ {})".format(arma[0], arma[1]),
        "action": "compraArma/{}/{}/{}/{}".format(pcId, arma[2], arma[1], arma[3])
    } for arma in armas
    ]

    page = {
        "name": "Loja",
        "background": "loja.jpg",
        "content": buttons
    }
    return render_template('index.html', page=page)

def pageLojaVendeAmuletos(pcId, amuletos):
    buttons = [
    {
        "type": "button",
        "text": "{} (Custo: $ {})".format(amuleto[0], amuleto[1]),
        "action": "compraAmuleto/{}/{}/{}/{}".format(pcId, amuleto[2], amuleto[1], amuleto[3])
    } for amuleto in amuletos
    ]

    page = {
        "name": "Loja",
        "background": "loja.jpg",
        "content": buttons
    }
    return render_template('index.html', page=page)

def pageLojaVendeFerramentas(pcId, Ferramentas):
    buttons = [
    {
        "type": "button",
        "text": "{} (Custo: $ {})".format(ferramenta[0], ferramenta[1]),
        "action": "compraFerramenta/{}/{}/{}/{}".format(pcId, ferramenta[2], ferramenta[1], ferramenta[3])
    } for ferramenta in Ferramentas
    ]

    page = {
        "name": "Loja",
        "background": "loja.jpg",
        "content": buttons
    }
    return render_template('index.html', page=page)


def pageLoja(dinheiro_player, pcId):
    page={
        "name":"Loja",
        "background":"loja.jpg",
        "content":[
            {
                "type": "text",
                "text": "Bem-vindo à Loja!"
            },
                        {
                "type": "text",
                "text": "Dinheiro: {}".format(dinheiro_player)
            },
            {
                "type": "text",
                "text": "Aqui você pode comprar equipamentos! O que procura?"
            },
            {
                "type": "button",
                "text": "Comprar armas",
                "action": "lojaVendeArmas/{}".format(pcId)
            },
            {
                "type": "button",
                "text": "Comprar amuletos",
                "action": "lojaVendeAmuletos/{}".format(pcId)
            },
            {
                "type": "button",
                "text": "Comprar ferramentas",
                "action": "lojaVendeFerramentas/{}".format(pcId)
            },
            {
                "type":"button",
                "text":"Voltar",
                "action":"regiao/{}".format(pcId)
            }
        ]
    }
    return render_template('index.html',page=page, dinheiro_player=dinheiro_player)

def pageErroNaCompra(pcId):
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
                "action":"retornaLoja/{}".format(pcId)
            }
        ]
    }
    return render_template('index.html',page=page)

def pageSucessoNaCompra(pcId):
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
                "action":"retornaLoja/{}".format(pcId)
            }
        ]
    }
    return render_template('index.html',page=page)
