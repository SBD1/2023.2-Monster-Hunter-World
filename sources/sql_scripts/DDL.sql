BEGIN;

-- Tabela Mapa
CREATE TABLE IF NOT EXISTS Mapa (
    IdMapa serial PRIMARY KEY,
    Nome varchar(64) NOT NULL,
    Descricao varchar(600) NOT NULL
);

-- Tabela Regiao
CREATE TABLE IF NOT EXISTS Regiao (
    IdRegiao serial PRIMARY KEY,
    Nome varchar(64) NOT NULL,
    Descricao varchar(600) NOT NULL,
    Mapa int REFERENCES Mapa(IdMapa)
);

-- Tabela LevaEm
CREATE TABLE IF NOT EXISTS LevaEm (
    RegiaoOrigem int,
    RegiaoDestino int,
    FOREIGN KEY (RegiaoOrigem) REFERENCES Regiao(IdRegiao),
    FOREIGN KEY (RegiaoDestino) REFERENCES Regiao(IdRegiao)
);

-- Tabela NPC
CREATE TABLE IF NOT EXISTS NPC (
    IdNPC serial PRIMARY KEY,
    Regiao int REFERENCES Regiao(IdRegiao),
    Nome varchar(64) NOT NULL,
    Descricao varchar(600),
    Funcao varchar(64),
    Raca varchar(32),
    Genero varchar(16)
);

-- Tabela PC
CREATE TABLE IF NOT EXISTS PC (
    IdPlayer serial PRIMARY KEY,
    Regiao int REFERENCES Regiao(IdRegiao),
    Nome varchar(64) NOT NULL,
    Ranque int DEFAULT 1,
    Vida int DEFAULT 500,
    Vigor int DEFAULT 200,
    Afinidade int DEFAULT 0,
    Dinheiro int DEFAULT 0,
    Genero varchar(16)
);

-- Tabela Amigato
CREATE TABLE IF NOT EXISTS Amigato (
    IdAmigato serial PRIMARY KEY,
    Regiao int REFERENCES Regiao(IdRegiao),
    PC int REFERENCES PC(IdPlayer),
    Nome varchar(64) NOT NULL,
    Nivel int DEFAULT 1,
    Status int DEFAULT 0,
    Vida int DEFAULT 100
);

-- Tabela Fala
CREATE TABLE IF NOT EXISTS Fala (
    IdFala serial PRIMARY KEY,
    NPC int REFERENCES NPC(IdNPC),
    Fala varchar(500),
    Repetivel boolean NOT NULL CHECK (Repetivel IN (true, false)),
    FoiExecutado boolean NOT NULL CHECK (FoiExecutado IN (true, false))
);

-- Tabela Monstro
CREATE TABLE IF NOT EXISTS Monstro (
    IdMonstro serial PRIMARY KEY,
    Nome varchar(64) NOT NULL,
    Elemento varchar(32),
    Vida int DEFAULT 100,
    Ataque int DEFAULT 100
);

-- Tabela InstanciaMonstro
CREATE TABLE IF NOT EXISTS InstanciaMonstro (
    IdInstanciaMonstro serial PRIMARY KEY,
    Monstro int REFERENCES Monstro(IdMonstro),
    Status int DEFAULT 0,
    Vida int DEFAULT 100,
);

-- Tabela RegiaoMonstro
CREATE TABLE IF NOT EXISTS RegiaoMonstro (
    IdRegiaoMonstro serial PRIMARY KEY,
    Regiao int REFERENCES Regiao(IdRegiao),
    Monstro int REFERENCES Monstro(IdMonstro)
);

-- Tabela AtacaMonstro
CREATE TABLE IF NOT EXISTS AtacaMonstro (
    IdAtacaMonstro serial PRIMARY KEY,
    PC int REFERENCES PC(IdPlayer),
    Monstro int REFERENCES Monstro(IdMonstro),
    Dano int DEFAULT 0,
    Horario timestamp DEFAULT current_timestamp
);

-- Tabela Forja
CREATE TABLE IF NOT EXISTS Forja (
    IdForja serial PRIMARY KEY,
    NPC int REFERENCES NPC(IdNPC),
    Tipo int DEFAULT 0
);

-- Tabela Missao
CREATE TABLE IF NOT EXISTS Missao (
    IdMissao serial PRIMARY KEY,
    Mapa int REFERENCES Mapa(IdMapa),
    NPC int REFERENCES NPC(IdNPC),
    Nome varchar(64) NOT NULL,
    Nivel int DEFAULT 1,
    Tipo int DEFAULT 0,
    Cliente varchar(64) NOT NULL,
    Descricao varchar(500),
    MaximoDesmaios int DEFAULT 3,
    Tempo int DEFAULT 40,
    Premio int DEFAULT 0,
    Resumo varchar(128),
    RanqueMinimo int DEFAULT 1
);

-- Tabela MissaoPreReq
CREATE TABLE IF NOT EXISTS MissaoPreReq (
    IdMissaoPreReq serial PRIMARY KEY,
    MissaoPreReq int REFERENCES Missao(IdMissao),
    Missao int REFERENCES Missao(IdMissao)
);

-- Tabela EtapaMonstro
CREATE TABLE IF NOT EXISTS EtapaMonstro (
    IdEtapaMonstro serial PRIMARY KEY,
    Missao int REFERENCES Missao(IdMissao),
    Monstro int REFERENCES Monstro(IdMonstro),
    Quantidade int DEFAULT 1
);

-- Tabela RealizaMissao
CREATE TABLE IF NOT EXISTS RealizaMissao (
    IdRealizaMissao serial PRIMARY KEY,
    Missao int REFERENCES Missao(IdMissao),
    PC int REFERENCES PC(IdPlayer),
    Status int DEFAULT 0
);

-- Tabela RealizaEtapa
CREATE TABLE IF NOT EXISTS RealizaEtapa (
    IdRealizaEtapa serial PRIMARY KEY,
    EtapaMissao int REFERENCES EtapaMonstro(IdEtapaMonstro),
    Quantidade int,
    PC int REFERENCES PC(IdPlayer),
    Status int DEFAULT 0
);

-- Tabela Item
CREATE TABLE IF NOT EXISTS Item (
    IdItem int PRIMARY KEY,
    Nome varchar(64) NOT NULL,
    Raridade int DEFAULT 1,
    Tipo int DEFAULT 0,
    Funcao varchar(64),
    Descricao varchar(600),
    ValorVenda int DEFAULT 0,
    CustoCompra int DEFAULT 0
);

-- Tabela Inventario
CREATE TABLE IF NOT EXISTS Inventario (
    IdInventario serial PRIMARY KEY,
    PC int REFERENCES PC(IdPlayer),
    CapacidadeMaxima int DEFAULT 20
);

-- Tabela Loja
CREATE TABLE IF NOT EXISTS Loja (
    IdLoja serial PRIMARY KEY,
    NPC int REFERENCES NPC(IdNPC),
    Tipo int DEFAULT 0
);

-- Tabela UtilizaItem
CREATE TABLE IF NOT EXISTS UtilizaItem (
    PC int REFERENCES PC(IdPlayer),
    Item int REFERENCES Item(IdItem)
);

-- Tabela GuardaItem
CREATE TABLE IF NOT EXISTS GuardaItem (
    Inventario int REFERENCES Inventario(IdInventario),
    Item int REFERENCES Item(IdItem),
    Quantidade int
);

-- Tabela CriaItem
CREATE TABLE IF NOT EXISTS CriaItem (
    Item int REFERENCES Item(IdItem),
    Quantidade int,
    ItemConsumido int REFERENCES Item(IdItem)
);

-- Tabela VendeItem
CREATE TABLE IF NOT EXISTS VendeItem (
    Loja int REFERENCES Loja(IdLoja),
    Item int REFERENCES Item(IdItem)
);

-- Tabela DropaItem
CREATE TABLE IF NOT EXISTS DropaItem (
    IdDropaItem serial PRIMARY KEY,
    Monstro int REFERENCES Monstro(IdMonstro),
    Item int REFERENCES Item(IdItem), 
    Chance real
);

-- Tabela Arma
CREATE TABLE IF NOT EXISTS Arma (
    IdArma int PRIMARY KEY REFERENCES Item(IdItem),
    Ataque int DEFAULT 0,
    Afiacao int DEFAULT 0,
    Elemento varchar(32),
    ValorElemento int DEFAULT 0
);

-- Tabela Armadura
CREATE TABLE IF NOT EXISTS Armadura (
    IdArmadura int PRIMARY KEY REFERENCES Item(IdItem),
    Defesa int DEFAULT 0,
    Fogo int DEFAULT 0,
    Agua int DEFAULT 0,
    Raio int DEFAULT 0,
    Gelo int DEFAULT 0,
    Dragao int DEFAULT 0
);

-- Tabela Ferramenta
CREATE TABLE IF NOT EXISTS Ferramenta (
    IdFerramenta int PRIMARY KEY REFERENCES Item(IdItem),
    TempoEfeito int DEFAULT 20,
    TempoRecarga int DEFAULT 10
);

COMMIT;
