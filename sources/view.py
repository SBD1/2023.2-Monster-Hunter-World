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
