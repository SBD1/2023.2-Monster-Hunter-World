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
    

def pageTutorial(pcId):
    page = {
        "name": "Área de Encontro",
        "background": "tutorialBackground.png",
        "content": [
            {
                "type": "text",
                "text": "Bem-vindo à Área de Encontro, --pegar da controller o nome!" 
            },
            {
                "type": "text",
                "text": "Passo 1: Esta é a sua jornada. Seu personagem foi criado com sucesso!"
            },
            {
                "type": "text",
                "text": "Passo 2: Agora, você aprenderá as mecânicas do jogo."
            },
            {
                "type": "text",
                "text": "Passo 3: Explore o mundo, lute contra monstros e complete missões emocionantes."
            },
            {
                "type": "text",
                "text": "Passo 4: Ao longo do caminho, você encontrará desafios e recompensas."
            },
            {
                "type": "button",
                "text": "Iniciar Jogo",
                "action": "movimentacao/{}".format(pcId)
            },
        ]
    }
    return render_template('index.html', page=page)


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



