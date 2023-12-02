from model import *
from controller import *
from flask import render_template, request

def pageCriarPersonagem():
    page={
        "name":"Trabalho de SBD1 - 2023.2",
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
                "name":"arma"           
            },
            {
                "type":"options",
                "text":"Genero:",
                "name":"genero"           
            },
            {
                "type":"input",
                "text":"Nome do Amigato:",
                "name":"amigato"           
            },
            {
                "type":"button",
                "text":"Confirmar",
                "action":"criarPersonagem"           
            },
        ]
    }
    return render_template('index.html',page=page)

def pageTutorial():
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
                "action": "iniciarJogo"
            },
        ]
    }
    return render_template('index.html', page=page)



