-- Criacao do Banco
CREATE DATABASE MonsterHunter;

-- Selecao do Banco
\c MonsterHunter;

-- Tabela Mapa
CREATE TABLE Mapa (
    IdMapa serial PRIMARY KEY,
    Nome varchar(64) NOT NULL,
    TamanhoX bigint NOT NULL,
    TamanhoY bigint NOT NULL,
    Descricao varchar(256) NOT NULL
);

-- Tabela Regiao
CREATE TABLE Regiao (
    IdRegiao serial PRIMARY KEY,
    Mapa int REFERENCES Mapa(IdMapa),
    Nome varchar(64) NOT NULL,
    xInicio bigint NOT NULL,
    yInicio bigint NOT NULL,
    xFim bigint NOT NULL,
    yFim bigint
);

-- Tabela NPC
CREATE TABLE NPC (
    IdNPC serial PRIMARY KEY,
    Regiao int REFERENCES Regiao(IdRegiao),
    Nome varchar(64) NOT NULL,
    x bigint DEFAULT 0,
    y bigint DEFAULT 0,
    Descricao varchar(256),
    Funcao varchar(64),
    Raca varchar(32),
    Genero varchar(16)
);

-- Tabela PC
CREATE TABLE PC (
    IdPlayer serial PRIMARY KEY,
    Regiao int REFERENCES Regiao(IdRegiao),
    Nome varchar(64) NOT NULL,
    x bigint DEFAULT 0,
    y bigint DEFAULT 0,
    Ranque int DEFAULT 1,
    Vida int DEFAULT 500,
    Vigor int DEFAULT 200,
    Afinidade int DEFAULT 0,
    Dinheiro int DEFAULT 0,
    Genero varchar(16),
    CorPele varchar(16) DEFAULT '#FFFFFF',
    CorCabelo varchar(16) DEFAULT '#000000',
    CorOlho varchar(16) DEFAULT '#000000',
    TipoCabelo int DEFAULT 0,
    TipoOlho int DEFAULT 0
);

-- Tabela Amigato
CREATE TABLE Amigato (
    IdAmigato serial PRIMARY KEY,
    Regiao int REFERENCES Regiao(IdRegiao),
    PC int REFERENCES PC(IdPlayer),
    Nome varchar(64) NOT NULL,
    x bigint DEFAULT 0,
    y bigint DEFAULT 0,
    Nivel int DEFAULT 1,
    Status int DEFAULT 0,
    Vida int DEFAULT 100
);


-- Tabela Fala
CREATE TABLE Fala (
    IdFala serial PRIMARY KEY,
    NPC int REFERENCES NPC(IdNPC),
    Fala varchar(256),
    Repetivel boolean NOT NULL CHECK (Repetivel IN (true, false))
);

-- Tabela FalaPreReq
CREATE TABLE FalaPreReq (
    IdFalaPreReq serial PRIMARY KEY,
    FalaPreReq int REFERENCES Fala(IdFala),
    Fala int REFERENCES Fala(IdFala)
);

-- Tabela Monstro
CREATE TABLE Monstro (
    IdMonstro serial PRIMARY KEY,
    IdAmigato int NOT NULL,
    Nome varchar(64) NOT NULL,
    Elemento varchar(32),
    AtacaMonstros boolean NOT NULL CHECK (AtacaMonstros IN (true, false)),
    AlcanceHostilidade int DEFAULT 0,
    Tipo int DEFAULT 0
);

-- Tabela InstanciaMonstro
CREATE TABLE InstanciaMonstro (
    IdInstanciaMonstro serial PRIMARY KEY,
    Monstro int REFERENCES Monstro(IdMonstro),
    Status int DEFAULT 0,
    Vida int DEFAULT 100,
    Tamanho int DEFAULT 0,
    Nivel int DEFAULT 1,
    Ataque int DEFAULT 100
);

-- Tabela RegiaoMonstro
CREATE TABLE RegiaoMonstro (
    IdRegiaoMonstro serial PRIMARY KEY,
    Regiao int REFERENCES Regiao(IdRegiao),
    Monstro int REFERENCES Monstro(IdMonstro)
);

-- Tabela AtacaMonstro
CREATE TABLE AtacaMonstro (
    IdAtacaMonstro serial PRIMARY KEY,
    PC int REFERENCES PC(IdPlayer),
    Monstro int REFERENCES Monstro(IdMonstro),
    Dano int DEFAULT 0,
    Horario timestamp DEFAULT current_timestamp
);

-- Tabela Missao
CREATE TABLE Missao (
    IdMissao serial PRIMARY KEY,
    Mapa int REFERENCES Mapa(IdMapa),
    NPC int REFERENCES NPC(IdNPC),
    Nome varchar(64) NOT NULL,
    Nivel int DEFAULT 1,
    Tipo int DEFAULT 0,
    Cliente varchar(64) NOT NULL,
    Descricao varchar(256),
    MaximoDesmaios int DEFAULT 3,
    Tempo int DEFAULT 40,
    Premio int DEFAULT 0,
    Resumo varchar(128),
    RanqueMinimo int DEFAULT 1
);


-- Tabela MissaoPreReq
CREATE TABLE MissaoPreReq (
    IdMissaoPreReq serial PRIMARY KEY,
    MissaoPreReq int REFERENCES Missao(IdMissao),
    Missao int REFERENCES Missao(IdMissao)
);

-- Tabela EtapaMissao
CREATE TABLE EtapaMissao (
    IdEtapaMissao serial PRIMARY KEY,
    Missao int REFERENCES Missao(IdMissao),
    Nome varchar(64) NOT NULL,
    Status int DEFAULT 0,
    Descricao varchar(256)
);

-- Tabela EtapaMonstro
CREATE TABLE EtapaMonstro (
    IdEtapaMonstro serial PRIMARY KEY,
    EtapaMissao int REFERENCES EtapaMissao(IdEtapaMissao),
    Monstro int REFERENCES Monstro(IdMonstro),
    Quantidade int DEFAULT 1
);

-- Tabela EtapaFala
CREATE TABLE EtapaFala (
    IdEtapaFala serial PRIMARY KEY,
    EtapaMissao int REFERENCES EtapaMissao(IdEtapaMissao),
    Fala int REFERENCES Fala(IdFala)
);

-- Tabela RealizaMissao
CREATE TABLE RealizaMissao (
    IdRealizaMissao serial PRIMARY KEY,
    Missao int REFERENCES Missao(IdMissao),
    PC int REFERENCES PC(IdPlayer),
    Status int DEFAULT 0
);

-- Tabela Inventario
CREATE TABLE Inventario (
    IdInventario serial PRIMARY KEY,
    PC int REFERENCES PC(IdPlayer),
    CapacidadeMaxima int DEFAULT 20
);

-- Tabela Loja
CREATE TABLE Loja (
    IdLoja serial PRIMARY KEY,
    NPC int REFERENCES NPC(IdNPC),
    Tipo int DEFAULT 0
);

-- Tabela Forja
CREATE TABLE Forja (
    IdForja serial PRIMARY KEY,
    NPC int REFERENCES NPC(IdNPC),
    Tipo int DEFAULT 0
);

-- Tabela Item
CREATE TABLE Item (
    IdItem serial PRIMARY KEY,
    Nome varchar(64) NOT NULL,
    Raridade int DEFAULT 1,
    Tipo int DEFAULT 0,
    Funcao varchar(64),
    Descricao varchar(256),
    ValorVenda int DEFAULT 0,
    CustoCompra int DEFAULT 0
);

-- Tabela DropaItem
CREATE TABLE DropaItem (
    IdDropaItem serial PRIMARY KEY,
    Monstro int REFERENCES InstanciaMonstro(IdInstanciaMonstro),
    Item int REFERENCES Item(IdItem)
);


-- Tabela GuardaItem
CREATE TABLE GuardaItem (
    IdGuardaItem serial PRIMARY KEY,
    Inventario int REFERENCES Inventario(IdInventario),
    Item int REFERENCES Item(IdItem)
);

-- Tabela UsaItem
CREATE TABLE UsaItem (
    IdUsaItem serial PRIMARY KEY,
    Forja int REFERENCES Forja(IdForja),
    Item int REFERENCES Item(IdItem)
);

-- Tabela Arma
CREATE TABLE Arma (
    IdArma serial PRIMARY KEY,
    Nome varchar(64) NOT NULL,
    Nivel int DEFAULT 1,
    Raridade int DEFAULT 1,
    CustoCompra int DEFAULT 0,
    ValorVenda int DEFAULT 0,
    Descricao varchar(256),
    Tipo int DEFAULT 0,
    Ataque int DEFAULT 0,
    Afiacao int DEFAULT 0,
    Elemento varchar(32),
    ValorElemento int DEFAULT 0
);

-- Tabela GuardaArma
CREATE TABLE GuardaArma (
    IdGuardaArma serial PRIMARY KEY,
    Inventario int REFERENCES Inventario(IdInventario),
    Arma int REFERENCES Arma(IdArma)
);

-- Tabela UtilizaArma
CREATE TABLE UtilizaArma (
    IdUtilizaArma serial PRIMARY KEY,
    PC int REFERENCES PC(IdPlayer),
    Arma int REFERENCES Arma(IdArma)
);

-- Tabela AmigatoArma
CREATE TABLE AmigatoArma (
    IdAmigatoArma serial PRIMARY KEY,
    Amigato int REFERENCES Amigato(IdAmigato),
    Arma int REFERENCES Arma(IdArma)
);

-- Tabela VendeArma
CREATE TABLE VendeArma (
    IdVendeArma serial PRIMARY KEY,
    Loja int REFERENCES Loja(IdLoja),
    Arma int REFERENCES Arma(IdArma)
);

-- Tabela CriaArma
CREATE TABLE CriaArma (
    IdCriaArma serial PRIMARY KEY,
    Forja int REFERENCES Forja(IdForja),
    Arma int REFERENCES Arma(IdArma)
);

-- Tabela Armadura
CREATE TABLE Armadura (
    IdArmadura serial PRIMARY KEY,
    Nome varchar(64) NOT NULL,
    Nivel int DEFAULT 1,
    Raridade int DEFAULT 1,
    CustoCompra int DEFAULT 0,
    ValorVenda int DEFAULT 0,
    Descricao varchar(256),
    Tipo int DEFAULT 0,
    Defesa int DEFAULT 0,
    Fogo int DEFAULT 0,
    Agua int DEFAULT 0,
    Raio int DEFAULT 0,
    Gelo int DEFAULT 0,
    Dragao int DEFAULT 0
);

-- Tabela GuardaArmadura
CREATE TABLE GuardaArmadura (
    IdGuardaArmadura serial PRIMARY KEY,
    Inventario int REFERENCES Inventario(IdInventario),
    Armadura int REFERENCES Armadura(IdArmadura)
);

-- Tabela UtilizaArmadura
CREATE TABLE UtilizaArmadura (
    IdUtilizaArmadura serial PRIMARY KEY,
    PC int REFERENCES PC(IdPlayer),
    Armadura int REFERENCES Armadura(IdArmadura)
);

-- Tabela AmigatoArmadura
CREATE TABLE AmigatoArmadura (
    IdAmigatoArmadura serial PRIMARY KEY,
    Amigato int REFERENCES Amigato(IdAmigato),
    Armadura int REFERENCES Armadura(IdArmadura)
);

-- Tabela VendeArmadura
CREATE TABLE VendeArmadura (
    IdVendeArmadura serial PRIMARY KEY,
    Loja int REFERENCES Loja(IdLoja),
    Armadura int REFERENCES Armadura(IdArmadura)
);


-- Tabela CriaArmadura
CREATE TABLE CriaArmadura (
    IdCriaArmadura serial PRIMARY KEY,
    Forja int REFERENCES Forja(IdForja),
    Armadura int REFERENCES Armadura(IdArmadura)
);

-- Tabela Amuleto
CREATE TABLE Amuleto (
    IdAmuleto serial PRIMARY KEY,
    Nome varchar(64) NOT NULL,
    Nivel int DEFAULT 1,
    Raridade int DEFAULT 1,
    CustoCompra int DEFAULT 0,
    ValorVenda int DEFAULT 0,
    Descricao varchar(256),
    Tipo int DEFAULT 0,
    Melhoria int DEFAULT 0
);

-- Tabela GuardaAmuleto
CREATE TABLE GuardaAmuleto (
    IdGuardaAmuleto serial PRIMARY KEY,
    Inventario int REFERENCES Inventario(IdInventario),
    Amuleto int REFERENCES Amuleto(IdAmuleto)
);

-- Tabela UtilizaAmuleto
CREATE TABLE UtilizaAmuleto (
    IdUtilizaAmuleto serial PRIMARY KEY,
    PC int REFERENCES PC(IdPlayer),
    Amuleto int REFERENCES Amuleto(IdAmuleto)
);

-- Tabela AmigatoAmuleto
CREATE TABLE AmigatoAmuleto (
    IdAmigatoAmuleto serial PRIMARY KEY,
    Amigato int REFERENCES Amigato(IdAmigato),
    Amuleto int REFERENCES Amuleto(IdAmuleto)
);

-- Tabela VendeAmuleto
CREATE TABLE VendeAmuleto (
    IdVendeAmuleto serial PRIMARY KEY,
    Loja int REFERENCES Loja(IdLoja),
    Amuleto int REFERENCES Amuleto(IdAmuleto)
);

-- Tabela CriaAmuleto
CREATE TABLE CriaAmuleto (
    IdCriaAmuleto serial PRIMARY KEY,
    Forja int REFERENCES Forja(IdForja),
    Amuleto int REFERENCES Amuleto(IdAmuleto)
);

-- Tabela Ferramenta
CREATE TABLE Ferramenta (
    IdFerramenta serial PRIMARY KEY,
    Nome varchar(64) NOT NULL,
    Nivel int DEFAULT 1,
    Raridade int DEFAULT 1,
    CustoCompra int DEFAULT 0,
    ValorVenda int DEFAULT 0,
    Descricao varchar(256),
    Tipo int DEFAULT 0,
    Funcao varchar(64),
    TempoEfeito int DEFAULT 20,
    TempoRecarga int DEFAULT 10
);

-- Tabela GuardaFerramenta
CREATE TABLE GuardaFerramenta (
    IdGuardaFerramenta serial PRIMARY KEY,
    Inventario int REFERENCES Inventario(IdInventario),
    Ferramenta int REFERENCES Ferramenta(IdFerramenta)
);

-- Tabela UtilizaFerramenta
CREATE TABLE UtilizaFerramenta (
    IdUtilizaFerramenta serial PRIMARY KEY,
    PC int REFERENCES PC(IdPlayer),
    Ferramenta int REFERENCES Ferramenta(IdFerramenta)
);

-- Tabela AmigatoFerramenta
CREATE TABLE AmigatoFerramenta (
    IdAmigatoFerramenta serial PRIMARY KEY,
    Amigato int REFERENCES Amigato(IdAmigato),
    Ferramenta int REFERENCES Ferramenta(IdFerramenta)
);

-- Tabela VendeFerramenta
CREATE TABLE VendeFerramenta (
    IdVendeFerramenta serial PRIMARY KEY,
    Loja int REFERENCES Loja(IdLoja),
    Ferramenta int REFERENCES Ferramenta(IdFerramenta)
);

-- Tabela Habilidade
CREATE TABLE Habilidade (
    IdHabilidade serial PRIMARY KEY,
    Nome varchar(64) NOT NULL,
    Nivel int DEFAULT 0,
    Descricao varchar(256),
    Funcao varchar(64)
);

-- Tabela HabilidadeAmuleto
CREATE TABLE HabilidadeAmuleto (
    IdHabilidadeAmuleto serial PRIMARY KEY,
    Amuleto int REFERENCES Amuleto(IdAmuleto),
    Habilidade int REFERENCES Habilidade(IdHabilidade)
);

-- Tabela HabilidadeArmadura
CREATE TABLE HabilidadeArmadura (
    IdHabilidadeArmadura serial PRIMARY KEY,
    Armadura int REFERENCES Armadura(IdArmadura),
    Habilidade int REFERENCES Habilidade(IdHabilidade)
);

