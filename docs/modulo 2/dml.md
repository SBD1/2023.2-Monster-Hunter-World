# Data Manipulation Language

## Introdução

A Data Manipulation Language (DML) é uma categoria de comandos em sistemas de gerenciamento de banco de dados (SGBD) que permite aos usuários ou aplicativos realizar operações de manipulação de dados em um banco de dados. Em essência, a DML é usada para inserir, atualizar, excluir e recuperar dados de um banco de dados.

## DML - Monster Hunter World

No módulo 2, após a etapa de DDL, populamos todas as tabelas no nosso banco de dados, através dos seguintes comandos SQL:

```
INSERT INTO Mapa (Nome, Descricao) VALUES
('Astera Archipelago', 'Um conjunto de ilhas exóticas, do misterioso Bosque Sombrio ao árido Deserto Flamejante, cada uma repleta de monstros desafiadores e ecossistemas únicos. Navegue pelas águas entre as ilhas, enfrentando perigos e descobrindo tesouros em sua busca pela supremacia como caçador.');

INSERT INTO Regiao (Mapa, Nome) VALUES
(1, 'Floresta Sombria'),
(1, 'Deserto Ardente'),
(1, 'Montanhas Geladas'),
(1, 'Planícies Trovejantes'),
(1, 'Selva Misteriosa'),
(1, 'Cavernas Obscuras');

INSERT INTO LevaEm (RegiaoOrigem, RegiaoDestino) VALUES
(1, 6), (1, 2), (6, 5), (6, 1), (5, 6), (5, 2), (5, 4), (2, 1), (2, 5), (2, 3), (3, 2), (3, 4), (4, 5), (4, 3);

INSERT INTO NPC (Regiao, Nome, Descricao, Funcao, Raca, Genero) VALUES 
(1, 'Excursionista (The Handler)', 'Sua fiel parceira durante a jornada, fornece informações e auxilia na gerência de missões.', 'Assistente de Campo', 'Humano', 'Feminino'),
(1, 'Comandante', 'Oferece missões principais e informações cruciais sobre a história do jogo.', 'Líder da Comissão', 'Humano', 'Masculino'),
(2, 'Gerente de Acampamento', 'Fornece serviços relacionados ao acampamento, como viagens rápidas e gerenciamento de equipamentos.', 'Administrador de Campo', 'Humano', 'Masculino'),
(2, 'Mestre de Forja (The Smithy)', 'Gerencia a forja e melhoria de equipamentos.', 'Ferreiro', 'Humano', 'Masculino'),
(3, 'Capitão', 'Fornece informações sobre as atividades de campo e expedições.', 'Oficial de Campo', 'Humano', 'Masculino'),
(3, 'Botânico', 'Permite o cultivo de plantas e criação de itens.', 'Agricultor', 'Humano', 'Masculino'),
(4, 'Chefe dos Pesquisadores', 'Oferece informações detalhadas sobre a fauna e os monstros da região.', 'Pesquisador Chefe', 'Humano', 'Masculino'),
(4, 'Feiticeira (Provisions Manager)', 'Gerencia o Cofre e o Gerenciador de Itens, fornecendo itens e provisões.', 'Gerente de Provisões', 'Humano', 'Feminino'),
(5, 'Comerciante', 'Vende itens e provisões essenciais para sua jornada.', 'Comerciante Ambulante', 'Humano', 'Masculino'),
(5, 'Excursionista (The Handler)', 'Acompanha você ao longo da história, fornecendo informações e auxiliando na gerência de missões.', 'Assistente de Campo', 'Humano', 'Feminino');

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

-- Floresta Sombria (Região 1)
INSERT INTO RegiaoMonstro (Regiao, Monstro)
VALUES 
    (1, 1),
    (1, 2),
    (1, 3);

-- Deserto Ardente (Região 2)
INSERT INTO RegiaoMonstro (Regiao, Monstro)
VALUES 
    (2, 2),
    (2, 3),
    (2, 4);

-- Montanhas Geladas (Região 3)
INSERT INTO RegiaoMonstro (Regiao, Monstro)
VALUES 
    (3, 4),
    (3, 5),
    (3, 6);

-- Planícies Trovejantes (Região 4)
INSERT INTO RegiaoMonstro (Regiao, Monstro)
VALUES 
    (4, 1),
    (4, 4),
    (4, 5);

-- Selva Misteriosa (Região 5)
INSERT INTO RegiaoMonstro (Regiao, Monstro)
VALUES 
    (5, 2),
    (5, 5),
    (5, 6);
	
-- Cavernas Obscuras (Região 6)
INSERT INTO RegiaoMonstro (Regiao, Monstro)
VALUES 
    (6, 1),
    (6, 4),
    (6, 6);

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

INSERT INTO MissaoPreReq (MissaoPreReq, Missao) VALUES
(1, 2), (2, 3), (3, 1);

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

-- ETAPA MONSTRO

-- Etapa para o Monstro "Grande Jagras"
INSERT INTO EtapaMonstro (EtapaMissao, Monstro, Quantidade)
VALUES (1, 1, 1),
       (2, 1, 1),
       (3, 1, 1);

-- Etapa para o Monstro "Kulu-Ya-Ku"
INSERT INTO EtapaMonstro (EtapaMissao, Monstro, Quantidade)
VALUES (4, 2, 1),
       (5, 2, 1),
       (6, 2, 1);

-- Etapa para o Monstro "Barroth"
INSERT INTO EtapaMonstro (EtapaMissao, Monstro, Quantidade)
VALUES (7, 3, 1),
       (8, 3, 1),
       (9, 3, 1);

-- Etapa para o Monstro "Jyuratodus"
INSERT INTO EtapaMonstro (EtapaMissao, Monstro, Quantidade)
VALUES (10, 4, 1),
       (11, 4, 1),
       (12, 4, 1);

-- Etapa para o Monstro "Rathalos"
INSERT INTO EtapaMonstro (EtapaMissao, Monstro, Quantidade)
VALUES (13, 5, 1),
       (14, 5, 1),
       (15, 5, 1);

-- Etapa para o Monstro "Anjanath"
INSERT INTO EtapaMonstro (EtapaMissao, Monstro, Quantidade)
VALUES (16, 6, 1),
       (17, 6, 1),
       (18, 6, 1);

-- ETAPA FALA

-- Etapas de Fala para a missão "Caça ao Grande Jagras"
INSERT INTO EtapaFala (EtapaMissao, Fala)
VALUES 
    (1, 11),
    (2, 12),
    (3, 12);

-- Etapas de Fala para a missão "Caça ao Kulu-Ya-Ku"
INSERT INTO EtapaFala (EtapaMissao, Fala)
VALUES 
    (4, 13),
    (5, 14),
    (6, 14);

-- Etapas de Fala para a missão "Caça ao Barroth"
INSERT INTO EtapaFala (EtapaMissao, Fala)
VALUES 
    (7, 15),
    (8, 16),
    (9, 16);

-- Etapas de Fala para a missão "Caça ao Jyuratodus"
INSERT INTO EtapaFala (EtapaMissao, Fala)
VALUES 
    (10, 17),
    (11, 18),
    (12, 18);

-- Etapas de Fala para a missão "Caça ao Rathalos"
INSERT INTO EtapaFala (EtapaMissao, Fala)
VALUES 
    (13, 19),
    (14, 20),
    (15, 20);

-- Etapas de Fala para a missão "Caça ao Anjanath"
INSERT INTO EtapaFala (EtapaMissao, Fala)
VALUES 
    (16, 21),
    (17, 22),
    (18, 22);

-- LOJA

INSERT INTO Loja (NPC, Tipo)
VALUES (3, 1),
       (9, 1);

-- FORJA

INSERT INTO Forja (NPC, Tipo)
VALUES (4, 1);

-- ITEM

-- Item "Poção"
INSERT INTO Item (Nome, Raridade, Tipo, Funcao, Descricao, ValorVenda, CustoCompra)
VALUES ('Poção', 1, 0, 'Restaura uma pequena quantidade de saúde.', 'A Poção é uma mistura medicinal de ingredientes naturais, que ao ser consumida, restaura gradualmente a saúde do caçador, vital para sobreviver às batalhas contra monstros formidáveis no mundo do jogo.', 8, 66);

-- Item 'Espeto para churrasco'
INSERT INTO Item (Nome, Raridade, Tipo, Funcao, Descricao, ValorVenda, CustoCompra)
VALUES ('Espeto para churrasco', 4, 0, 'Grelha carnes e vegetais em churrascos.', 'Espeto para churrasco: utensílio longo e afiado, usado para espetar carnes e legumes, permitindo grelhá-los uniformemente sobre chamas ou brasas durante churrascos, realçando o sabor com deliciosos aromas defumados.', 0, NULL);

-- Item 'Nulberry'
INSERT INTO Item (Nome, Raridade, Tipo, Funcao, Descricao, ValorVenda, CustoCompra)
VALUES ('Nulberry', 2, 0, 'Remove efeitos negativos em Monster Hunter.', 'Nulberry em Monster Hunter: World é um fruto que remove efeitos negativos como veneno e paralisia, permitindo aos caçadores manterem-se saudáveis e ágeis durante as batalhas, aumentando as chances de sobrevivência e sucesso nas caçadas.', 120, NULL);

-- Item 'Pólvora Nível 1'
INSERT INTO Item (Nome, Raridade, Tipo, Funcao, Descricao, ValorVenda, CustoCompra)
VALUES ('Pólvora Nível 1', 1, 0, 'Aumenta poder de munição em armas.', 'Pólvora de Nível 1 é uma variante de pólvora que, quando usada em munição, aumenta a potência explosiva, proporcionando maior dano e impacto durante combates, essencial para estratégias avançadas e derrotar inimigos poderosos.', 1, 8);

-- Item 'Binóculos'
INSERT INTO Item (Nome, Raridade, Tipo, Funcao, Descricao, ValorVenda, CustoCompra)
VALUES ('Binóculos', 1, 0, 'Permite ver mais longe e observar à distância.', 'Binóculos são dispositivos ópticos que ampliam a visão, permitindo observação detalhada de objetos distantes. Usados em atividades como observação de pássaros, caça ou esportes, oferecem maior clareza e zoom, facilitando a visualização de detalhes.', 5, 50);

-- Item 'Might Seed'
INSERT INTO Item (Nome, Raridade, Tipo, Funcao, Descricao, ValorVenda, CustoCompra)
VALUES ('Might Seed', 2, 0, 'Fortalece temporariamente seus ataques quando ingerido.', 'Planta que, quando consumida, concede temporariamente um aumento de força ao personagem. É um item estratégico usado em batalhas intensas para maximizar o dano infligido aos inimigos, sendo valioso para jogadores que buscam vantagem tática.', 140, NULL);

-- Item 'Frasco vazio'
INSERT INTO Item (Nome, Raridade, Tipo, Funcao, Descricao, ValorVenda, CustoCompra)
VALUES ('Frasco vazio', 1, 0, 'Armazena líquidos ou ingredientes.', 'Um frasco vazio regularmente velho. Nada mais nada menos.', 1, 5);

-- Item 'Carne crua'
INSERT INTO Item (Nome, Raridade, Tipo, Funcao, Descricao, ValorVenda, CustoCompra)
VALUES ('Carne crua', 1, 0, 'Ingrediente para cozinhar ou alimentar.', 'Carne esculpida de um monstro. Pode ser cozido, combinado ou usado para montar uma armadilha.', 5, 10);

-- Item 'Bife Bem Passado'
INSERT INTO Item (Nome, Raridade, Tipo, Funcao, Descricao, ValorVenda, CustoCompra)
VALUES ('Bife Bem Passado', 2, 0, 'Carne grelhada totalmente cozida.', 'Fornece um aumento moderado à sua resistência e a mantém no máximo por um período mais longo. Carne bem feita!', 48, NULL);

-- Itens que dropam dos Monstros

INSERT INTO Item (Nome, Raridade, Tipo, Funcao, Descricao, ValorVenda, CustoCompra)
VALUES 
    ('Escama de Grande Jagras', 1, 0, 'Material para crafting', 'Uma escama resistente do Grande Jagras.', 50, 10),
    ('Pena de Kulu-Ya-Ku', 1, 0, 'Material para crafting', 'Uma pena bonita do Kulu-Ya-Ku.', 60, 15),
    ('Concha de Barroth', 1, 0, 'Material para crafting', 'Uma concha resistente do Barroth.', 70, 20),
    ('Escama de Jyuratodus', 1, 0, 'Material para crafting', 'Uma escama escorregadia do Jyuratodus.', 80, 25),
    ('Garra de Rathalos', 2, 0, 'Material para crafting', 'Uma garra afiada do Rathalos.', 200, 50),
    ('Dente de Anjanath', 2, 0, 'Material para crafting', 'Um dente impressionante do Anjanath.', 180, 45);

-- DROPA ITEM

INSERT INTO DropaItem (Monstro, Item)
VALUES 
    (1, 10),
    (2, 11),
    (3, 12),
    (4, 13),
    (5, 14),
    (6, 15);


-- ARMA

-- Arma Espada Grande
INSERT INTO Arma (Nome, Nivel, Raridade, CustoCompra, ValorVenda, Descricao, Tipo, Ataque, Afiacao, Elemento, ValorElemento)
VALUES ('Espada Grande', 1, 6, 12000, 6000, 'Uma poderosa espada forjada a partir dos ossos de um Dragão Ancião. Extremamente afiada e capaz de causar danos devastadores.', 0, 980, 120, 'Dragão', 250);

-- Arma Lâminas Duplas
INSERT INTO Arma (Nome, Nivel, Raridade, CustoCompra, ValorVenda, Descricao, Tipo, Ataque, Afiacao, Elemento, ValorElemento)
VALUES ('Lâminas Duplas', 1, 2, 800, 400, 'Um par de lâminas leves e rápidas, ideais para ataques rápidos e precisos. Perfeitas para caçadores ágeis que gostam de dançar ao redor de seus inimigos.', 0, 150, 60, 'Fogo', 20);

-- Arma Martelo
INSERT INTO Arma (Nome, Nivel, Raridade, CustoCompra, ValorVenda, Descricao, Tipo, Ataque, Afiacao, Elemento, ValorElemento)
VALUES ('Martelo', 1, 3, 1000, 500, 'Um poderoso martelo de caça, projetado para esmagar os ossos dos monstros. Ideal para caçadores que preferem ataques contundentes e impactantes.', 0, 180, 80, 'Trovão', 15);

-- Arma Chifre de Caça
INSERT INTO Arma (Nome, Nivel, Raridade, CustoCompra, ValorVenda, Descricao, Tipo, Ataque, Afiacao, Elemento, ValorElemento)
VALUES ('Chifre de Caça', 1, 3, 1200, 600, 'Um Chifre de Caça elegante e poderoso, capaz de tocar melodias encantadoras para fortalecer os aliados e enfraquecer os inimigos. Uma escolha ideal para caçadores que preferem apoiar suas equipes.', 0, 150, 70, 'Nenhum', 0);

-- Arma Lâmina Carregada
INSERT INTO Arma (Nome, Nivel, Raridade, CustoCompra, ValorVenda, Descricao, Tipo, Ataque, Afiacao, Elemento, ValorElemento)
VALUES ('Lâmina Carregada', 1, 3, 1500, 750, 'Uma Lâmina Carregada poderosa e versátil, capaz de alternar entre espada e escudo e uma lâmina carregada para ataques devastadores. Ideal para caçadores que desejam flexibilidade no campo de batalha.', 0, 160, 70, 'Fogo', 15);

-- Arma Glaive de Inseto
INSERT INTO Arma (Nome, Nivel, Raridade, CustoCompra, ValorVenda, Descricao, Tipo, Ataque, Afiacao, Elemento, ValorElemento)
VALUES ('Glaive de Inseto', 1, 2, 1800, 900, 'Uma Glaive de Inseto ágil e mortal, equipada com um inseto controlado que pode extrair essências dos monstros para fortalecer o caçador. Perfeita para caçadores que apreciam combate aéreo e versatilidade.', 0, 140, 60, 'Venenoso', 10);

-- Arma Arco
INSERT INTO Arma (Nome, Nivel, Raridade, CustoCompra, ValorVenda, Descricao, Tipo, Ataque, Afiacao, Elemento, ValorElemento)
VALUES ('Arco', 1, 2, 2000, 1000, 'Um Arco habilmente projetado para disparar uma variedade de flechas, desde flechas de perfuração até flechas elementais. Perfeito para caçadores que preferem ataques à distância e precisão.', 0, 120, 50, 'Água', 12);

-- Arma Besta Pesada
INSERT INTO Arma (Nome, Nivel, Raridade, CustoCompra, ValorVenda, Descricao, Tipo, Ataque, Afiacao, Elemento, ValorElemento)
VALUES ('Besta Pesada', 1, 3, 2500, 1250, 'Uma Besta Pesada poderosa e pesada, capaz de disparar grandes projéteis e munições especializadas para causar danos massivos aos monstros. Ideal para caçadores que preferem atirar de longe e causar explosões impressionantes.', 0, 160, 40, 'Explosão', 20);

-- VENDE ARMA

INSERT INTO VendeArma (Loja, Arma)
VALUES 
    (2, 4),
    (2, 5),
    (2, 6),
    (2, 7),
    (2, 8);

-- CRIA ARMA

INSERT INTO CriaArma (Forja, Arma)
VALUES 
    (1, 1),
    (1, 2),
    (1, 3);
	
-- ARMADURA
    
-- Armadura Conjunto de Armadura de Liga
INSERT INTO Armadura (Nome, Nivel, Raridade, CustoCompra, ValorVenda, Descricao, Tipo, Defesa, Fogo, Agua, Raio, Gelo, Dragao)
VALUES ('Conjunto de Armadura de Liga', 1, 2, 2500, 1250, 'Uma armadura excepcionalmente resistente, criada a partir dos materiais mais robustos da natureza. Projetada para oferecer proteção incomparável sem sacrificar a mobilidade, ela representa a harmonia entre tecnologia e natureza.', 0, 40, 10, 5, -10, -10, 5);

-- Armadura Conjunto de Armadura Anja
INSERT INTO Armadura (Nome, Nivel, Raridade, CustoCompra, ValorVenda, Descricao, Tipo, Defesa, Fogo, Agua, Raio, Gelo, Dragao)
VALUES ('Conjunto de Armadura Anja', 1, 3, 7500, 3750, 'Uma armadura impressionante, forjada a partir dos formidáveis materiais do Anjanath, uma fera temível. Com uma fusão de escamas resistentes e ossos robustos, esta armadura oferece uma defesa excepcional contra os mais poderosos ataques.', 0, 100, 15, -15, -5, -5, 0);

-- Armadura Conjunto de Armadura Baan
INSERT INTO Armadura (Nome, Nivel, Raridade, CustoCompra, ValorVenda, Descricao, Tipo, Defesa, Fogo, Agua, Raio, Gelo, Dragao)
VALUES ('Conjunto de Armadura Baan', 1, 3, 7500, 3750, 'Uma armadura formidável feita a partir dos materiais resistentes do Barroth e Banbaro, incorporando sua robustez e resistência. As placas duras e ossos densos oferecem uma defesa excepcional contra ataques poderosos.', 0, 120, 0, 10, 0, -5, -10);

-- Armadura Conjunto de Armadura Barroth
INSERT INTO Armadura (Nome, Nivel, Raridade, CustoCompra, ValorVenda, Descricao, Tipo, Defesa, Fogo, Agua, Raio, Gelo, Dragao)
VALUES ('Conjunto de Armadura Barroth', 1, 2, 2500, 1250, 'Uma imponente armadura confeccionada com os materiais resistentes do Barroth, uma criatura poderosa. Suas placas de carapaça e ossos maciços oferecem uma defesa robusta contra os ataques mais ferozes das bestas.', 0, 70, -15, -5, 15, -5, 0);

-- Armadura Conjunto de Armadura Flor de Cerejeira
INSERT INTO Armadura (Nome, Nivel, Raridade, CustoCompra, ValorVenda, Descricao, Tipo, Defesa, Fogo, Agua, Raio, Gelo, Dragao)
VALUES ('Conjunto de Armadura Flor de Cerejeira', 1, 3, 7500, 3750, 'Uma armadura encantadora e elegante, adornada com flores e detalhes que evocam a beleza da natureza. Criada a partir de materiais delicados, mas surpreendentemente resistentes, essa armadura oferece uma defesa sólida sem sacrificar a graça.', 0, 90, 5, 5, 20, 5, 5);

-- Armadura Conjunto de Armadura de Ossos
INSERT INTO Armadura (Nome, Nivel, Raridade, CustoCompra, ValorVenda, Descricao, Tipo, Defesa, Fogo, Agua, Raio, Gelo, Dragao)
VALUES ('Conjunto de Armadura de Ossos', 1, 1, 1000, 500, 'Uma armadura primitiva feita de ossos de criaturas poderosas. Apesar de sua aparência sinistra, oferece defesa sólida contra ataques ferozes. Cada peça é robusta e elaborada com detalhes cuidadosos, proporcionando proteção excepcional aos caçadores.', 0, 30, 10, 0, 10, 0, 10);

-- Armadura Conjunto de Armadura Brigada
INSERT INTO Armadura (Nome, Nivel, Raridade, CustoCompra, ValorVenda, Descricao, Tipo, Defesa, Fogo, Agua, Raio, Gelo, Dragao)
VALUES ('Conjunto de Armadura Brigada', 1, 4, 15000, 7500, 'Uma armadura militar sofisticada e impressionante, projetada para caçadores que valorizam tanto a proteção quanto a elegância. Fabricada com materiais resistentes, esta armadura oferece defesa sólida contra os ataques mais ferozes das criaturas.', 0, 140, 5, 0, 10, 0, 10);

-- Armadura Conjunto de Armadura de Malha de Corrente
INSERT INTO Armadura (Nome, Nivel, Raridade, CustoCompra, ValorVenda, Descricao, Tipo, Defesa, Fogo, Agua, Raio, Gelo, Dragao)
VALUES ('Conjunto de Armadura de Malha de Corrente', 1, 1, 500, 250, 'Uma armadura clássica feita de anéis de metal entrelaçados, oferecendo proteção sólida e flexibilidade. Projetada para equilibrar resistência e mobilidade, é uma escolha popular para caçadores que valorizam versatilidade em combate.', 0, 10, 0, 10, 0, 0, 0);

-- VendeArmadura
INSERT INTO VendeArmadura (Loja, Armadura)
VALUES
  (1, 1),
  (1, 2),
  (1, 3), 
  (1, 4); 
  
  -- CriaArmadura
INSERT INTO CriaArmadura (Forja, Armadura)
VALUES
  (1, 1), 
  (1, 2), 
  (2, 3), 
  (2, 4); 
  
-- Amuleto de Defesa
INSERT INTO Amuleto (Nome, Nivel, Raridade, CustoCompra, ValorVenda, Descricao, Tipo, Melhoria)
VALUES ('Amuleto de Defesa', 1, 3, 100, 50, 'Aumenta a defesa do caçador.', 'Defesa', 0);

-- Amuleto de Ataque
INSERT INTO Amuleto (Nome, Nivel, Raridade, CustoCompra, ValorVenda, Descricao, Tipo, Melhoria)
VALUES ('Amuleto de Ataque', 1, 2, 120, 60, 'Aumenta o poder de ataque do caçador.', 'Ataque', 0);

-- Amuleto da Vida
INSERT INTO Amuleto (Nome, Nivel, Raridade, CustoCompra, ValorVenda, Descricao, Tipo, Melhoria)
VALUES ('Amuleto da Vida', 1, 4, 150, 75, 'Aumenta a vida máxima do caçador.', 'Vida', 0);

-- Amuleto de Sorte
INSERT INTO Amuleto (Nome, Nivel, Raridade, CustoCompra, ValorVenda, Descricao, Tipo, Melhoria)
VALUES ('Amuleto de Sorte', 2, 5, 200, 100, 'Aumenta a chance de obter itens raros.', 'Sorte', 0);

-- VendeAmuleto
INSERT INTO VendeAmuleto (Loja, Amuleto)
VALUES
  (1, 1), 
  (1, 2), 
  (2, 3), 
  (2, 4); 

-- CriaAmuleto
INSERT INTO CriaAmuleto (Forja, Amuleto)
VALUES
  (1, 1), 
  (1, 2), 
  (2, 3), 
  (2, 4); 
  
-- Manta de Vitalidade
INSERT INTO Ferramenta (Nome, Nivel, Raridade, CustoCompra, ValorVenda, Descricao, Tipo, Funcao, TempoEfeito, TempoRecarga)
VALUES ('Manta de Vitalidade', 1, 3, 100, 50, 'Restaura a vida do caçador e aliados.', 'Manta', 'Recuperação', 60, 300);

-- Pedra de Amolar
INSERT INTO Ferramenta (Nome, Nivel, Raridade, CustoCompra, ValorVenda, Descricao, Tipo, Funcao, TempoEfeito, TempoRecarga)
VALUES ('Pedra de Amolar', 1, 2, 50, 25, 'Afia a arma do caçador para melhorar o corte.', 'Afiação', 'Amolar', 0, 0);

-- Manto de Camuflagem
INSERT INTO Ferramenta (Nome, Nivel, Raridade, CustoCompra, ValorVenda, Descricao, Tipo, Funcao, TempoEfeito, TempoRecarga)
VALUES ('Manto de Camuflagem', 2, 4, 200, 100, 'Torna o caçador invisível para monstros.', 'Manta', 'Camuflagem', 90, 420);

-- Poção de Energia
INSERT INTO Ferramenta (Nome, Nivel, Raridade, CustoCompra, ValorVenda, Descricao, Tipo, Funcao, TempoEfeito, TempoRecarga)
VALUES ('Poção de Energia', 1, 1, 20, 10, 'Recupera a resistência do caçador.', 'Poção', 'Energia', 60, 120);

-- Vende Ferramenta
INSERT INTO VendeFerramenta (Loja, Ferramenta)
VALUES
  (1, 1), 
  (2, 2), 
  (1, 3), 
  (2, 4); 

INSERT INTO Habilidade (Nome, Nivel, Descricao, Funcao) VALUES
('Curandeiro', 1, 'Aumenta a eficácia de itens de cura.', 'Suporte'),
('Atirador', 2, 'Aumenta a precisão de ataques à distância.', 'Ofensiva'),
('Escapista', 3, 'Aumenta a velocidade de movimento ao fugir de monstros.', 'Defensiva');

-- Habilidade de Ataque
INSERT INTO Habilidade (Nome, Nivel, Descricao, Funcao)
VALUES ('Habilidade de Ataque', 1, 'Aumenta o poder de ataque do caçador.', 'Ataque');

-- Habilidade de Defesa
INSERT INTO Habilidade (Nome, Nivel, Descricao, Funcao)
VALUES ('Habilidade de Defesa', 1, 'Aumenta a defesa do caçador.', 'Defesa');

-- Habilidade de Cura
INSERT INTO Habilidade (Nome, Nivel, Descricao, Funcao)
VALUES ('Habilidade de Cura', 1, 'Permite ao caçador curar-se mais eficazmente.', 'Cura');

-- Habilidade de Camuflagem
INSERT INTO Habilidade (Nome, Nivel, Descricao, Funcao)
VALUES ('Habilidade de Camuflagem', 2, 'Torna o caçador menos visível para monstros.', 'Camuflagem');

-- HabilidadeAmuleto
INSERT INTO HabilidadeAmuleto (Amuleto, Habilidade)
VALUES
  (2, 1), 
  (1, 2), 
  (3, 3), 
  (4, 4); 

-- HabilidadeArmadura
INSERT INTO HabilidadeArmadura (Armadura, Habilidade)
VALUES
  (1, 3), 
  (2, 4), 
  (3, 2), 
  (4, 1); 

```