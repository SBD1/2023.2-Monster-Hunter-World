-- MAPA
INSERT INTO Mapa (Nome, TamanhoX, TamanhoY, Descricao)
VALUES ('Floresta Antiga', 1000, 1000, 'Mapa exuberante com uma diversidade de ambientes, incluindo densas florestas e áreas abertas.');

-- REGIÕES
INSERT INTO Regiao (Mapa, Nome, xInicio, yInicio, xFim, yFim)
VALUES (1, 'Área Central', 0, 0, 500, 500),
       (1, 'Área Noroeste', 0, 500, 250, 1000),
       (1, 'Área Norte', 500, 500, 1000, 1000),
       (1, 'Área Sudoeste', 0, 0, 500, 500),
       (1, 'Área Sudeste', 500, 0, 1000, 500);


-- NPCS

INSERT INTO NPC (Regiao, Nome, x, y, Descricao, Funcao, Raca, Genero)
VALUES 
    (1, 'Excursionista (The Handler)', 150, 150, 'Sua fiel parceira durante a jornada, fornece informações e auxilia na gerência de missões.', 'Assistente de Campo', 'Humano', 'Feminino'),
    (1, 'Comandante', 300, 300, 'Oferece missões principais e informações cruciais sobre a história do jogo.', 'Líder da Comissão', 'Humano', 'Masculino'),
    (2, 'Gerente de Acampamento', 50, 850, 'Fornece serviços relacionados ao acampamento, como viagens rápidas e gerenciamento de equipamentos.', 'Administrador de Campo', 'Humano', 'Masculino'),
    (2, 'Mestre de Forja (The Smithy)', 150, 850, 'Gerencia a forja e melhoria de equipamentos.', 'Ferreiro', 'Humano', 'Masculino'),
    (3, 'Capitão', 500, 750, 'Fornece informações sobre as atividades de campo e expedições.', 'Oficial de Campo', 'Humano', 'Masculino'),
    (3, 'Botânico', 600, 750, 'Permite o cultivo de plantas e criação de itens.', 'Agricultor', 'Humano', 'Masculino'),
    (4, 'Chefe dos Pesquisadores', 50, 50, 'Oferece informações detalhadas sobre a fauna e os monstros da região.', 'Pesquisador Chefe', 'Humano', 'Masculino'),
    (4, 'Feiticeira (Provisions Manager)', 150, 50, 'Gerencia o Cofre e o Gerenciador de Itens, fornecendo itens e provisões.', 'Gerente de Provisões', 'Humano', 'Feminino'),
    (5, 'Comerciante', 850, 50, 'Vende itens e provisões essenciais para sua jornada.', 'Comerciante Ambulante', 'Humano', 'Masculino'),
    (5, 'Excursionista (The Handler)', 750, 50, 'Acompanha você ao longo da história, fornecendo informações e auxiliando na gerência de missões.', 'Assistente de Campo', 'Humano', 'Feminino');


-- FALAS

INSERT INTO Fala (NPC, Fala, Repetivel)
VALUES 
    (1, 'Estou aqui para te auxiliar em sua jornada, pronto para partir em mais uma missão?', false),
    (2, 'As informações que trago são cruciais para nossa estratégia. Está pronto para enfrentar os desafios?', false),
    (3, 'Bem-vindo ao acampamento! Precisa de algo para tornar sua expedição mais confortável?', false),
    (4, 'Suas armas precisam de forja e afiação. Venha, vamos melhorá-las para enfrentar monstros ainda mais poderosos.', false),
    (5, 'Explorar o desconhecido é o nosso lema. Está preparado para desbravar os campos e descobrir seus segredos?', false),
    (6, 'As plantas são essenciais. Cultive-as, e elas lhe proporcionarão os meios para enfrentar até mesmo os monstros mais ferozes.', false),
    (7, 'A fauna e flora aqui são incrivelmente diversas. Fique atento para descobrir os segredos que o ambiente esconde.', false),
    (8, 'O que você precisa hoje? Provisões, itens essenciais ou talvez um reabastecimento para sua próxima missão?', false),
    (9, 'Se precisar de algo, estou aqui para oferecer os melhores equipamentos e itens. Vamos garantir que você esteja preparado!', false),
    (10, 'Aventura nos aguarda! Prontos para enfrentar os desafios juntos e escrever nossa história nesse mundo vasto?', false);

-- FALAS SOBRE MISSOES

-- Falas para o NPC "Grande Jagras"
INSERT INTO Fala (NPC, Fala, Repetivel)
VALUES (1, 'Olá, caçador! A missão que temos para você é a "Caça ao Grande Jagras".', false),
       (1, 'O Grande Jagras está ameaçando as áreas próximas. Sua tarefa é eliminar essa ameaça para garantir a segurança da região.', false);

-- Falas para o NPC "Kulu-Ya-Ku"
INSERT INTO Fala (NPC, Fala, Repetivel)
VALUES (2, 'Saudações! Temos uma missão importante para você: "Caça ao Kulu-Ya-Ku".', false),
       (2, 'O Kulu-Ya-Ku está causando estragos na região. Sua missão é eliminar esse monstro e restaurar a paz.', false);

-- Falas para o NPC "Barroth"
INSERT INTO Fala (NPC, Fala, Repetivel)
VALUES (1, 'Ei, caçador! A missão que temos disponível é a "Caça ao Barroth".', false),
       (1, 'O Barroth está representando uma ameaça à região. Sua tarefa é eliminar esse monstro para garantir a segurança dos habitantes.', false);

-- Falas para o NPC "Jyuratodus"
INSERT INTO Fala (NPC, Fala, Repetivel)
VALUES (2, 'Olá! Temos uma missão desafiadora para você: "Caça ao Jyuratodus".', false),
       (2, 'Um Jyuratodus está causando estragos na região. Sua tarefa é eliminar esse monstro e restaurar a paz.', false);

-- Falas para o NPC "Rathalos"
INSERT INTO Fala (NPC, Fala, Repetivel)
VALUES (1, 'Saudações, caçador! A missão que precisamos que você realize é a "Caça ao Rathalos".', false),
       (1, 'Um Rathalos ameaça a segurança da região. Sua missão é derrotá-lo e garantir a paz.', false);

-- Falas para o NPC "Anjanath"
INSERT INTO Fala (NPC, Fala, Repetivel)
VALUES (2, 'Ei, aventureiro! Temos uma missão para você: "Caça ao Anjanath".', false),
       (2, 'Um Anjanath está representando uma ameaça à região. Sua tarefa é eliminar esse monstro e restaurar a paz.', false);


-- FALAS PRE REQ

INSERT INTO FalaPreReq (FalaPreReq, Fala)
VALUES (11, 12), -- Caça ao Grande Jagras
       (13, 14), -- Caça ao Kulu-Ya-Ku
       (15, 16), -- Caça ao Barroth
       (17, 18), -- Caça ao Jyuratodus
       (19, 20), -- Caça ao Rathalos
       (21, 22); -- Caça ao Anjanath


-- MONSTROS

INSERT INTO Monstro (IdAmigato, Nome, Elemento, AtacaMonstros, AlcanceHostilidade, Tipo)
VALUES 
    (NULL, 'Grande Jagras', 'None', true, 0, 0),
    (NULL, 'Kulu-Ya-Ku', 'None', true, 0, 0),
    (NULL, 'Barroth', 'None', true, 0, 0),
    (NULL, 'Jyuratodus', 'None', true, 0, 0),
    (NULL, 'Rathalos', 'Fogo', true, 0, 0),
    (NULL, 'Anjanath', 'Fogo', true, 0, 0);


-- INSTANCIAS MONSTROS

-- Grande Jagras
INSERT INTO InstanciaMonstro (Monstro, Status, Vida, Tamanho, Nivel, Ataque)
VALUES 
    (1, 0, 100, 0, 1, 100),
    (1, 0, 100, 0, 1, 100),
    (1, 0, 100, 0, 1, 100);

-- Kulu-Ya-Ku
INSERT INTO InstanciaMonstro (Monstro, Status, Vida, Tamanho, Nivel, Ataque)
VALUES 
    (2, 0, 100, 0, 1, 100),
    (2, 0, 100, 0, 1, 100);

-- Barroth
INSERT INTO InstanciaMonstro (Monstro, Status, Vida, Tamanho, Nivel, Ataque)
VALUES 
    (3, 0, 100, 0, 1, 100);

-- Jyuratodus
INSERT INTO InstanciaMonstro (Monstro, Status, Vida, Tamanho, Nivel, Ataque)
VALUES 
    (4, 0, 100, 0, 1, 100);

-- Rathalos
INSERT INTO InstanciaMonstro (Monstro, Status, Vida, Tamanho, Nivel, Ataque)
VALUES 
    (5, 0, 100, 0, 1, 100);

-- Anjanath
INSERT INTO InstanciaMonstro (Monstro, Status, Vida, Tamanho, Nivel, Ataque)
VALUES 
    (6, 0, 100, 0, 1, 100),
    (6, 0, 100, 0, 1, 100);


-- REGIAO MONSTRO

-- Área Central (Região 1)
INSERT INTO RegiaoMonstro (Regiao, Monstro)
VALUES 
    (1, 1),
    (1, 2),
    (1, 3);

-- Área Noroeste (Região 2)
INSERT INTO RegiaoMonstro (Regiao, Monstro)
VALUES 
    (2, 2),
    (2, 3),
    (2, 4);

-- Área Norte (Região 3)
INSERT INTO RegiaoMonstro (Regiao, Monstro)
VALUES 
    (3, 4),
    (3, 5),
    (3, 6);

-- Área Sudoeste (Região 4)
INSERT INTO RegiaoMonstro (Regiao, Monstro)
VALUES 
    (4, 1),
    (4, 4),
    (4, 5);

-- Área Sudeste (Região 5)
INSERT INTO RegiaoMonstro (Regiao, Monstro)
VALUES 
    (5, 2),
    (5, 5),
    (5, 6);


-- MISSÕES

-- Grande Jagras
INSERT INTO Missao (Mapa, NPC, Nome, Nivel, Tipo, Cliente, Descricao, MaximoDesmaios, Tempo, Premio, Resumo, RanqueMinimo)
VALUES (1, 2, 'Caça ao Grande Jagras', 1, 0, 'Comandante', 'O Grande Jagras está ameaçando as áreas próximas. Derrote-o para garantir a segurança da região.', 3, 40, 100, 'Derrote o Grande Jagras', 1);

-- Kulu-Ya-Ku
INSERT INTO Missao (Mapa, NPC, Nome, Nivel, Tipo, Cliente, Descricao, MaximoDesmaios, Tempo, Premio, Resumo, RanqueMinimo)
VALUES (1, 2, 'Caça ao Kulu-Ya-Ku', 2, 0, 'Gerente de Acampamento', 'O Kulu-Ya-Ku está causando estragos na região. Sua tarefa é eliminar esse monstro e restaurar a paz.', 3, 40, 120, 'Derrote o Kulu-Ya-Ku', 2);

-- Barroth
INSERT INTO Missao (Mapa, NPC, Nome, Nivel, Tipo, Cliente, Descricao, MaximoDesmaios, Tempo, Premio, Resumo, RanqueMinimo)
VALUES (1, 1, 'Caça ao Barroth', 3, 0, 'Chefe dos Pesquisadores', 'O Barroth está representando uma ameaça à região. Elimine-o para garantir a segurança dos habitantes.', 3, 45, 150, 'Derrote o Barroth', 3);

-- Jyuratodus
INSERT INTO Missao (Mapa, NPC, Nome, Nivel, Tipo, Cliente, Descricao, MaximoDesmaios, Tempo, Premio, Resumo, RanqueMinimo)
VALUES (1, 1, 'Caça ao Jyuratodus', 4, 0, 'Botânico', 'Um Jyuratodus está causando estragos na região. Sua tarefa é eliminar esse monstro e restaurar a paz.', 3, 50, 200, 'Derrote o Jyuratodus', 4);

-- Rathalos
INSERT INTO Missao (Mapa, NPC, Nome, Nivel, Tipo, Cliente, Descricao, MaximoDesmaios, Tempo, Premio, Resumo, RanqueMinimo)
VALUES (1, 2, 'Caça ao Rathalos', 5, 0, 'Capitão', 'Um Rathalos ameaça a segurança da região. Sua missão é derrotá-lo e garantir a paz.', 3, 55, 250, 'Derrote o Rathalos', 5);

-- Anjanath
INSERT INTO Missao (Mapa, NPC, Nome, Nivel, Tipo, Cliente, Descricao, MaximoDesmaios, Tempo, Premio, Resumo, RanqueMinimo)
VALUES (1, 1, 'Caça ao Anjanath', 6, 0, 'Comerciante', 'Um Anjanath está representando uma ameaça à região. Sua tarefa é eliminar esse monstro e restaurar a paz.', 3, 60, 300, 'Derrote o Anjanath', 6);


-- MISSÕES PRÉ-REQ

INSERT INTO MissaoPreReq (MissaoPreReq, Missao)
VALUES 
    (1, 2),
    (2, 3),
    (3, 4),
    (4, 5),
    (5, 6);

-- ETAPAS MISSOES

-- Etapas para a missão "Caça ao Grande Jagras"
INSERT INTO EtapaMissao (Missao, Nome, Descricao)
VALUES (1, 'Localize o Grande Jagras', 'Encontre e rastreie o Grande Jagras na Floresta Antiga.'),
       (1, 'Prepare-se para a batalha', 'Aprimore suas armas e prepare suas estratégias para enfrentar o Grande Jagras.'),
       (1, 'Derrote o Grande Jagras', 'Enfrente o Grande Jagras e elimine a ameaça da região.');

-- Etapas para a missão "Caça ao Kulu-Ya-Ku"
INSERT INTO EtapaMissao (Missao, Nome, Descricao)
VALUES (2, 'Localize o Kulu-Ya-Ku', 'Rastreie o Kulu-Ya-Ku e encontre sua localização atual.'),
       (2, 'Prepare-se para a batalha', 'Prepare suas armas e equipe-se adequadamente para enfrentar o Kulu-Ya-Ku.'),
       (2, 'Derrote o Kulu-Ya-Ku', 'Enfrente o Kulu-Ya-Ku e restaure a paz na região.');

-- Etapas para a missão "Caça ao Barroth"
INSERT INTO EtapaMissao (Missao, Nome, Descricao)
VALUES (3, 'Localize o Barroth', 'Rastreie o Barroth e encontre sua localização atual.'),
       (3, 'Prepare-se para a batalha', 'Aprimore suas armas e prepare-se para o confronto com os Barroths que estão na região.'),
       (3, 'Derrote os Barroths', 'Desafie os Barroths e elimine a ameaça da região.');

-- Etapas para a missão "Caça ao Jyuratodus"
INSERT INTO EtapaMissao (Missao, Nome, Descricao)
VALUES (4, 'Localize o Jyuratodus', 'Rastreie o Jyuratodus e encontre sua localização atual.'),
       (4, 'Prepare-se para a batalha', 'Aprimore suas armas e prepare-se para enfrentar o Jyuratodus.'),
       (4, 'Derrote o Jyuratodus', 'Encare o Jyuratodus e restaure a paz na região.');

-- Etapas para a missão "Caça ao Rathalos"
INSERT INTO EtapaMissao (Missao, Nome, Descricao)
VALUES (5, 'Localize o Rathalos', 'Rastreie o Rathalos e encontre sua localização atual.'),
       (5, 'Prepare-se para a batalha', 'Prepare suas armas e equipamentos para enfrentar os Rathalos.'),
       (5, 'Derrote os Rathalos', 'Enfrente os Rathalos e restaure a paz na região.');

-- Etapas para a missão "Caça ao Anjanath"
INSERT INTO EtapaMissao (Missao, Nome, Descricao)
VALUES (6, 'Localize o Anjanath', 'Rastreie o Anjanath e encontre sua localização atual.'),
       (6, 'Prepare-se para a batalha', 'Aprimore suas armas e equipamentos para o confronto com o Anjanath.'),
       (6, 'Derrote os Anjanaths', 'Desafie os Anjanaths e elimine a ameaça da região.');
