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
    

def pageTutorial(nome_player, pcId, nome_npc, mapa_nome, regiaoAtualNome, possivelRegiaoNome, outraPossivelRegiaoNome):
    page = {
        "name": "Área de Encontro",
        "background": "tutorialBackground.png",
        "content": [
            {
                "type": "text",
                "text": "{}:".format(nome_npc)
            },
            {
                "type": "text",
                "text": "Saudações, caçador {}! Bem-vindo à {} em {}. Sou o {} e estou aqui para guiá-lo nesta jornada emocionante.".format(nome_player, regiaoAtualNome, mapa_nome, nome_npc)
            },
            {
                "type": "text",
                "text": "{} é a cidade principal e a base central de operações em Monster Hunter World.".format(mapa_nome)
            },
            {
                "type": "text",
                "text": "Aqui em {} você poderá se locomover livremente entre 3 regiões: A {}, o {} e o {}.".format(mapa_nome, regiaoAtualNome, possivelRegiaoNome, outraPossivelRegiaoNome)
            },
            {
                "type": "text",
                "text": "A {} é um espaço dedicado a encontros e interações entre caçadores, enquanto o {} oferece missões desafiadoras e empolgantes.".format(regiaoAtualNome, possivelRegiaoNome)
            },
            {
                "type": "text",
                "text": "Explore o {} em {}, onde a Loja oferece equipamentos para fortalecer seu caçador. Na Forja, você pode aprimorar esses equipamentos para enfrentar ameaças ainda maiores.".format(outraPossivelRegiaoNome, mapa_nome)
            },
            {
                "type": "text",
                "text": "Prepare-se para desafios épicos e descubra o vasto mundo de Monster Hunter World. Boa caçada, {}. Que sua jornada seja repleta de glórias!".format(nome_player)
            },
            {
                "type": "button",
                "text": "Iniciar Jogo",
                "action": "movimentacao/{}".format(pcId)
            },
        ]
    }
    return render_template('index.html', page=page, nome_player=nome_player, nome_npc=nome_npc, mapa_nome=mapa_nome, regiaoAtualNome=regiaoAtualNome, possivelRegiaoNome=possivelRegiaoNome, outraPossivelRegiaoNome=outraPossivelRegiaoNome)



def pageMovimentacao(pcId):
    page={
        "name":"Você está no Acampamento Base, para onde quer ir agora?",
        "background":"mainBackground.jpg",
        "content":[
            {
                "type":"button",
                "text":"Centro de Recursos",
                "action":"retornaCentroRecursos/{}".format(pcId)           
            },
            {
                "type":"button",
                "text":"Área de Encontro",
                "action":"assistente/{}-{}".format(pcId, 4)           
            }
        ]
    }
    return render_template('index.html',page=page)


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

def pageForja(dadosFerreiro, pcId):
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
                "text": "Eu sou o {}.".format(dadosFerreiro)  
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
    return render_template('index.html', page=page)

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

def pageForjarArmas(din, pcId, armas):
    buttons = [{
        "type": "text",
        "text": "Saldo atual: {} z".format(din)
    }]

    buttons += [{
        "type": "button",
        "text": "{} - Ataque: {} - Custo: {} z".format(arma[0], arma[3], arma[1]),
        "action": "forjaArma/{}/{}/{}/{}".format(pcId, arma[2], arma[1], arma[3])
    } for arma in armas
    ]

    buttons.append({
        "type":"button",
        "text":"Voltar",
        "action":"retornaForjarEquipamento/{}".format(pcId)
    })

    page = {
        "name": "Forjar Armas",
        "background": "forja.jpg",
        "content": buttons
    }
    return render_template('index.html', page=page, din=din)

def pageForjarArmaduras(din, pcId, armaduras):
    buttons = [{
        "type": "text",
        "text": "Saldo atual: {} z".format(din)
    }]
        
    buttons += [{
        "type": "button",
        "text": "{} - Defesa: {} - Custo: {} z".format(armadura[0], armadura[3], armadura[1]),
        "action": "forjaArmadura/{}/{}/{}/{}".format(pcId, armadura[2], armadura[1], armadura[3])
    } for armadura in armaduras
    ]

    buttons.append({
        "type":"button",
        "text":"Voltar",
        "action":"retornaForjarEquipamento/{}".format(pcId)
    })

    page = {
        "name": "Forjar Armaduras",
        "background": "forja.jpg",
        "content": buttons
    }
    return render_template('index.html', page=page , din=din)


def pageMovimentacao(pcId):
    page={
        "name":"Você está no Acampamento Base, para onde quer ir agora?",
        "background":"mainBackground.jpg",
        "content":[
            {
                "type":"button",
                "text":"Centro de Recursos",
                "action":"atualizaPCRegiao/{}/{}".format(pcId, 8)           
            },
            {
                "type":"button",
                "text":"Área de Encontro",
                "action":"atualizaPCRegiao/{}/{}".format(pcId, 9)          
            },

        ]
    }
    return render_template('index.html',page=page)

def pageCentroRecursos(pcId, leva_em, regiao):
    buttons = [
        {
            "type": "button",
            "text": "Ir para a região {}".format(regiao.nome),
            "action": "atualizaPCRegiao/{}/{}".format(pcId, regiao.id_regiao)
        } for regiao in leva_em
    ]

    page = {
        "name": regiao.nome,
        "background": "centro-recursos.jpg",
        "content": [
            {
                "type": "text",
                "text": "Bem-vindo ao Centro de Recursos!"
            },
            {
                "type": "text",
                "text": "Aqui você pode comprar ou forjar equipamentos!"
            },
            {
                "type": "text",
                "text": "Para onde gostaria de ir?"
            },
            {
                "type": "button",
                "text": "Loja",
                "action": "retornaLoja/{}".format(pcId)
            },
            {
                "type": "button",
                "text": "Forja",
                "action": "retornaForja/{}".format(pcId)
            },
            *buttons
        ]
    }
    return render_template('index.html',page=page)

def pageAreaEncontro(pcId, leva_em, regiao):
    page={
        "name":"Bem vindo à Área de Encontro",
        "background":"mainBackground.jpg",
        "content":[
            {
                "type":"button",
                "text":"Área de Encontro, {}, {}".format(regiao.nome, leva_em[0].nome),
                "action":"retornaAreaEncontro/{}".format(pcId)   
            }
        ]
    }
    return render_template('index.html',page=page)

def pageRegiao(regiao, leva_em, pcId):
    if regiao.id_regiao == 8:
        return pageCentroRecursos(pcId, leva_em, regiao)
    elif regiao.id_regiao == 9:
        return pageAreaEncontro(pcId, leva_em, regiao)
    elif regiao.id_regiao == 7:
        return pageMovimentacao(pcId)
    
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
                "action":"regiao/{}".format(pcId)
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
                "action":"regiao/{}".format(pcId)
            }
        ]
    }
    return render_template('index.html',page=page)
