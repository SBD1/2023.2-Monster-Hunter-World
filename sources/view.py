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
            "action":str(pc.id_player)
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
    

def pageTutorial(nome_player, pcId):
    page = {
        "name": "Área de Encontro",
        "background": "tutorialBackground.png",
        "content": [
            {
                "type": "text",
                "text": "Comandante:"
            },
            {
                "type": "text",
                "text": "Saudações, caçador {}! Bem-vindo à Área de Encontro em Astera. Sou o Comandante e estou aqui para guiá-lo nesta jornada emocionante.".format(nome_player)
            },
            {
                "type": "text",
                "text": "Astera é a cidade principal e a base central de operações em Monster Hunter World."
            },
            {
                "type": "text",
                "text": "Aqui em Astera você poderá se locomover livremente entre 3 regiões: A Área de Encontro, o Acampamento Base e o Centro de Recursos."
            },
            {
                "type": "text",
                "text": "A Área de Encontro é um espaço dedicado a encontros e interações entre caçadores, enquanto o Acampamento Base oferece missões desafiadoras e empolgantes."
            },
            {
                "type": "text",
                "text": "Explore o Centro de Recursos em Astera, onde a Loja oferece equipamentos para fortalecer seu caçador. Na Forja, você pode aprimorar esses equipamentos para enfrentar ameaças ainda maiores."
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
    return render_template('index.html', page=page, nome_player=nome_player)



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
                "action":"retornaAreaEncontro/{}".format(pcId)           
            }
        ]
    }
    return render_template('index.html',page=page)

def pageCentroRecursos(pcId):
    page={
        "name":"Centro de Recursos",
        "background":"centro-recursos.jpg",
        "content":[
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
                "type":"button",
                "text":"Loja",
                "action":"retornaLoja/{}".format(pcId)           
            },
            {
                "type":"button",
                "text":"Forja",
                "action":"retornaForja/{}".format(pcId)        
            }
        ]
    }
    return render_template('index.html',page=page)

def pageAreaEncontro(pcId):
    page={
        "name":"Bem vindo à Área de Encontro",
        "background":"mainBackground.jpg",
        "content":[
            {
                "type":"button",
                "text":"Área de Encontro",
                "action":"retornaAreaEncontro"           
            }
        ]
    }
    return render_template('index.html',page=page)

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
                "text": "Aqui você pode comprar seus equipamentos! Você possui {} dinheiros!".format(dinheiro_player)
            },
            {
                "type":"text",
                "text":"O que quer comprar hoje?"         
            },
            {
                "type":"button",
                "text":"Comprar",
                "action":"retornaComprar"           
            },
            {
                "type":"button",
                "text":"Voltar",
                "action":"retornaCentroRecursos"           
            }
        ]
    }
    return render_template('index.html',page=page, dinheiro_player=dinheiro_player)



