-- Tabela Mapa
CREATE TABLE IF NOT EXISTS Mapa (
    IdMapa serial PRIMARY KEY,
    Nome varchar(64) NOT NULL,
    TamanhoX bigint NOT NULL,
    TamanhoY bigint NOT NULL,
    Descricao varchar(256) NOT NULL
);

-- Tabela Regiao
CREATE TABLE IF NOT EXISTS Regiao (
    IdRegiao serial PRIMARY KEY,
    Mapa int REFERENCES Mapa(IdMapa),
    Nome varchar(64) NOT NULL,
    xInicio bigint NOT NULL,
    yInicio bigint NOT NULL,
    xFim bigint NOT NULL,
    yFim bigint
);

-- Tabela NPC
CREATE TABLE IF NOT EXISTS NPC (
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
CREATE TABLE IF NOT EXISTS PC (
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
CREATE TABLE IF NOT EXISTS Amigato (
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
CREATE TABLE IF NOT EXISTS Fala (
    IdFala serial PRIMARY KEY,
    NPC int REFERENCES NPC(IdNPC),
    Fala varchar(256),
    Repetivel boolean NOT NULL CHECK (Repetivel IN (true, false))
);

-- Tabela FalaPreReq
CREATE TABLE IF NOT EXISTS FalaPreReq (
    IdFalaPreReq serial PRIMARY KEY,
    FalaPreReq int REFERENCES Fala(IdFala),
    Fala int REFERENCES Fala(IdFala)
);

-- Tabela Monstro
CREATE TABLE IF NOT EXISTS Monstro (
    IdMonstro serial PRIMARY KEY,
    IdAmigato int,
    Nome varchar(64) NOT NULL,
    Elemento varchar(32),
    AtacaMonstros boolean NOT NULL CHECK (AtacaMonstros IN (true, false)),
    AlcanceHostilidade int DEFAULT 0,
    Tipo int DEFAULT 0
);

-- Tabela InstanciaMonstro
CREATE TABLE IF NOT EXISTS InstanciaMonstro (
    IdInstanciaMonstro serial PRIMARY KEY,
    Monstro int REFERENCES Monstro(IdMonstro),
    Status int DEFAULT 0,
    Vida int DEFAULT 100,
    Tamanho int DEFAULT 0,
    Nivel int DEFAULT 1,
    Ataque int DEFAULT 100
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
    Descricao varchar(256),
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

-- Tabela EtapaMissao
CREATE TABLE IF NOT EXISTS EtapaMissao (
    IdEtapaMissao serial PRIMARY KEY,
    Missao int REFERENCES Missao(IdMissao),
    Nome varchar(64) NOT NULL,
    Status int DEFAULT 0,
    Descricao varchar(256)
);

-- Tabela EtapaMonstro
CREATE TABLE IF NOT EXISTS EtapaMonstro (
    IdEtapaMonstro serial PRIMARY KEY,
    EtapaMissao int REFERENCES EtapaMissao(IdEtapaMissao),
    Monstro int REFERENCES Monstro(IdMonstro),
    Quantidade int DEFAULT 1
);

-- Tabela EtapaFala
CREATE TABLE IF NOT EXISTS EtapaFala (
    IdEtapaFala serial PRIMARY KEY,
    EtapaMissao int REFERENCES EtapaMissao(IdEtapaMissao),
    Fala int REFERENCES Fala(IdFala)
);

-- Tabela RealizaMissao
CREATE TABLE IF NOT EXISTS RealizaMissao (
    IdRealizaMissao serial PRIMARY KEY,
    Missao int REFERENCES Missao(IdMissao),
    PC int REFERENCES PC(IdPlayer),
    Status int DEFAULT 0
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


-- Tabela Item
CREATE TABLE IF NOT EXISTS Item (
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
CREATE TABLE IF NOT EXISTS DropaItem (
    IdDropaItem serial PRIMARY KEY,
    Monstro int REFERENCES InstanciaMonstro(IdInstanciaMonstro),
    Item int REFERENCES Item(IdItem)
);


-- Tabela GuardaItem
CREATE TABLE IF NOT EXISTS GuardaItem (
    IdGuardaItem serial PRIMARY KEY,
    Inventario int REFERENCES Inventario(IdInventario),
    Item int REFERENCES Item(IdItem)
);

-- Tabela UsaItem
CREATE TABLE IF NOT EXISTS UsaItem (
    IdUsaItem serial PRIMARY KEY,
    Forja int REFERENCES Forja(IdForja),
    Item int REFERENCES Item(IdItem)
);

-- Tabela Arma
CREATE TABLE IF NOT EXISTS Arma (
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
CREATE TABLE IF NOT EXISTS GuardaArma (
    IdGuardaArma serial PRIMARY KEY,
    Inventario int REFERENCES Inventario(IdInventario),
    Arma int REFERENCES Arma(IdArma)
);

-- Tabela UtilizaArma
CREATE TABLE IF NOT EXISTS UtilizaArma (
    IdUtilizaArma serial PRIMARY KEY,
    PC int REFERENCES PC(IdPlayer),
    Arma int REFERENCES Arma(IdArma)
);

-- Tabela AmigatoArma
CREATE TABLE IF NOT EXISTS AmigatoArma (
    IdAmigatoArma serial PRIMARY KEY,
    Amigato int REFERENCES Amigato(IdAmigato),
    Arma int REFERENCES Arma(IdArma)
);

-- Tabela VendeArma
CREATE TABLE IF NOT EXISTS VendeArma (
    IdVendeArma serial PRIMARY KEY,
    Loja int REFERENCES Loja(IdLoja),
    Arma int REFERENCES Arma(IdArma)
);

-- Tabela CriaArma
CREATE TABLE IF NOT EXISTS CriaArma (
    IdCriaArma serial PRIMARY KEY,
    Forja int REFERENCES Forja(IdForja),
    Arma int REFERENCES Arma(IdArma)
);

-- Tabela Armadura
CREATE TABLE IF NOT EXISTS Armadura (
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
CREATE TABLE IF NOT EXISTS GuardaArmadura (
    IdGuardaArmadura serial PRIMARY KEY,
    Inventario int REFERENCES Inventario(IdInventario),
    Armadura int REFERENCES Armadura(IdArmadura)
);

-- Tabela UtilizaArmadura
CREATE TABLE IF NOT EXISTS UtilizaArmadura (
    IdUtilizaArmadura serial PRIMARY KEY,
    PC int REFERENCES PC(IdPlayer),
    Armadura int REFERENCES Armadura(IdArmadura)
);

-- Tabela AmigatoArmadura
CREATE TABLE IF NOT EXISTS AmigatoArmadura (
    IdAmigatoArmadura serial PRIMARY KEY,
    Amigato int REFERENCES Amigato(IdAmigato),
    Armadura int REFERENCES Armadura(IdArmadura)
);

-- Tabela VendeArmadura
CREATE TABLE IF NOT EXISTS VendeArmadura (
    IdVendeArmadura serial PRIMARY KEY,
    Loja int REFERENCES Loja(IdLoja),
    Armadura int REFERENCES Armadura(IdArmadura)
);


-- Tabela CriaArmadura
CREATE TABLE IF NOT EXISTS CriaArmadura (
    IdCriaArmadura serial PRIMARY KEY,
    Forja int REFERENCES Forja(IdForja),
    Armadura int REFERENCES Armadura(IdArmadura)
);

-- Tabela Amuleto
CREATE TABLE IF NOT EXISTS Amuleto (
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
CREATE TABLE IF NOT EXISTS GuardaAmuleto (
    IdGuardaAmuleto serial PRIMARY KEY,
    Inventario int REFERENCES Inventario(IdInventario),
    Amuleto int REFERENCES Amuleto(IdAmuleto)
);

-- Tabela UtilizaAmuleto
CREATE TABLE IF NOT EXISTS UtilizaAmuleto (
    IdUtilizaAmuleto serial PRIMARY KEY,
    PC int REFERENCES PC(IdPlayer),
    Amuleto int REFERENCES Amuleto(IdAmuleto)
);

-- Tabela AmigatoAmuleto
CREATE TABLE IF NOT EXISTS AmigatoAmuleto (
    IdAmigatoAmuleto serial PRIMARY KEY,
    Amigato int REFERENCES Amigato(IdAmigato),
    Amuleto int REFERENCES Amuleto(IdAmuleto)
);

-- Tabela VendeAmuleto
CREATE TABLE IF NOT EXISTS VendeAmuleto (
    IdVendeAmuleto serial PRIMARY KEY,
    Loja int REFERENCES Loja(IdLoja),
    Amuleto int REFERENCES Amuleto(IdAmuleto)
);

-- Tabela CriaAmuleto
CREATE TABLE IF NOT EXISTS CriaAmuleto (
    IdCriaAmuleto serial PRIMARY KEY,
    Forja int REFERENCES Forja(IdForja),
    Amuleto int REFERENCES Amuleto(IdAmuleto)
);

-- Tabela Ferramenta
CREATE TABLE IF NOT EXISTS Ferramenta (
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
CREATE TABLE IF NOT EXISTS GuardaFerramenta (
    IdGuardaFerramenta serial PRIMARY KEY,
    Inventario int REFERENCES Inventario(IdInventario),
    Ferramenta int REFERENCES Ferramenta(IdFerramenta)
);

-- Tabela UtilizaFerramenta
CREATE TABLE IF NOT EXISTS UtilizaFerramenta (
    IdUtilizaFerramenta serial PRIMARY KEY,
    PC int REFERENCES PC(IdPlayer),
    Ferramenta int REFERENCES Ferramenta(IdFerramenta)
);

-- Tabela AmigatoFerramenta
CREATE TABLE IF NOT EXISTS AmigatoFerramenta (
    IdAmigatoFerramenta serial PRIMARY KEY,
    Amigato int REFERENCES Amigato(IdAmigato),
    Ferramenta int REFERENCES Ferramenta(IdFerramenta)
);

-- Tabela VendeFerramenta
CREATE TABLE IF NOT EXISTS VendeFerramenta (
    IdVendeFerramenta serial PRIMARY KEY,
    Loja int REFERENCES Loja(IdLoja),
    Ferramenta int REFERENCES Ferramenta(IdFerramenta)
);

-- Tabela Habilidade
CREATE TABLE IF NOT EXISTS Habilidade (
    IdHabilidade serial PRIMARY KEY,
    Nome varchar(64) NOT NULL,
    Nivel int DEFAULT 0,
    Descricao varchar(256),
    Funcao varchar(64)
);

-- Tabela HabilidadeAmuleto
CREATE TABLE IF NOT EXISTS HabilidadeAmuleto (
    IdHabilidadeAmuleto serial PRIMARY KEY,
    Amuleto int REFERENCES Amuleto(IdAmuleto),
    Habilidade int REFERENCES Habilidade(IdHabilidade)
);

-- Tabela HabilidadeArmadura
CREATE TABLE IF NOT EXISTS HabilidadeArmadura (
    IdHabilidadeArmadura serial PRIMARY KEY,
    Armadura int REFERENCES Armadura(IdArmadura),
    Habilidade int REFERENCES Habilidade(IdHabilidade)
);

