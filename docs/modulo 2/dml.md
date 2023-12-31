# Data Manipulation Language

## Introdução

A Data Manipulation Language (DML) é uma categoria de comandos em sistemas de gerenciamento de banco de dados (SGBD) que permite aos usuários ou aplicativos realizar operações de manipulação de dados em um banco de dados. Em essência, a DML é usada para inserir, atualizar, excluir e recuperar dados de um banco de dados.

## DML - Monster Hunter World

No módulo 2, após a etapa de DDL, populamos todas as tabelas no nosso banco de dados, através dos seguintes comandos SQL:

```
INSERT INTO Mapa (Nome, Descricao) VALUES
('Astera', 'Astera é a cidade principal e a base de operações central em Monster Hunter World.'),
('Coral Highlands', 'Área caracterizada por altos penhascos, pontes de coral e florestas de corais vibrantes que proporcionam uma atmosfera visualmente impressionante.');

INSERT INTO Regiao (Mapa, Nome) VALUES
(2, 'Cavernas Submersas'),
(2, 'Formações de Coral'),
(2, 'Pontes de Coral'),
(2, 'Toca de Legiana'),
(2, 'Ninhos'),
(2, 'Áreas de Repouso'),
(1, 'Acampamento Base'),
(1, 'Centro de Recursos'),
(1, 'Área de Encontro');

INSERT INTO LevaEm (RegiaoOrigem, RegiaoDestino) VALUES
(1, 6), (1, 2), (6, 5), (6, 1), (5, 6), (5, 2), (5, 4), (2, 1), (2, 5), (2, 3), (3, 2), (3, 4), (4, 5), (4, 3), (8, 9), (8, 7), (7, 8), (9, 8);

INSERT INTO NPC (Regiao, Nome, Descricao, Funcao, Raca, Genero) VALUES 
(7, 'Comandante', 'Explica a história do jogo ao player.', 'Líder da Comissão', 'Humano', 'Masculino'),
(8, 'Mestre de Forja (The Smithy)', 'Gerencia a forja e melhoria de equipamentos.', 'Ferreiro', 'Humano', 'Masculino'),
(8, 'Comerciante', 'Vende itens e provisões essenciais para sua jornada.', 'Comerciante Ambulante', 'Humano', 'Masculino'),
(9, 'A assistente', 'Fornece as principais informações sobre as missões.', 'Assistente de Campo', 'Humano', 'Feminino');

-- FALAS
INSERT INTO Fala (NPC, Fala, Repetivel)
VALUES 
    (1, 'Bem-vindo à Comissão, Caçador. Nossa missão é enfrentar as criaturas que ameaçam nosso mundo. Estamos contando com você para manter o equilíbrio.', true),
    (1, 'Neste momento, você está em Astera, nossa base de operações, e aqui, onde conversamos, é o acampamento base. No centro de recursos, você encontra uma loja e uma forja, onde pode comprar itens e aprimorar seus equipamentos. Já na área de encontros, você recebe mais informações sobre missões.', true),
    (2, 'Ah, Caçador! Vejo que está em busca de força. Aqui, forjamos a lâmina que corta o destino. O que quer forjar hoje?', true),
    (3, 'Ora, ora! Vejo que está em busca de suprimentos. Nada como um bom negócio para um caçador sagaz. Dê uma olhada, e encontrará o que precisa para enfrentar os desafios que aguardam.', true),
    (4, 'Oi, Caçador! Pronta para mais uma aventura?', true),
    (4, 'Sua primeira missão é de nível 1, e consiste em uma caçada. O Grande Jagras está ameaçando as áreas próximas. Derrote-o para garantir a segurança da região.', false),
    (4, 'Sua segunda missão é de nível 2, e consiste em uma caçada. Um Kulu-Ya-Ku e um Barroth estão causando problemas na região. Sua missão é encontrar estes dois monstros e eliminá-los para garantir a segurança.', false),
    (4, 'Sua terceira missão é de nível 2, e consiste em uma caçada. Um Jyuratodus e um Rathalos estão causando problemas na região. Sua missão é encontrar estes dois monstros e eliminá-los para garantir a segurança.', false),
    (4, 'Sua quarta missão é de nível 3 e é muito perigosa. Três Anjanaths estão representando uma ameaça à região. Sua tarefa é eliminar esses monstros e restaurar a paz.', false);

-- FALAS PRE REQ

INSERT INTO FalaPreReq (FalaPreReq, Fala)
VALUES (1, 2), (5, 6), (5, 7), (5, 8), (5, 9);

-- MONSTROS

INSERT INTO Monstro (IdAmigato, Nome, Elemento, AtacaMonstros, AlcanceHostilidade, Tipo)
VALUES 
    (NULL, 'Grande Jagras', 'None', true, 0, 0),
    (NULL, 'Kulu-Ya-Ku', 'None', true, 0, 0),
    (NULL, 'Barroth', 'None', true, 0, 0),
    (NULL, 'Jyuratodus', 'None', true, 0, 0),
    (NULL, 'Rathalos', 'Fogo', true, 0, 0),
    (NULL, 'Anjanath', 'Fogo', true, 0, 0);


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
    (1, 4),
    (1, 5),
    (1, 6),
    (2, 1),
    (2, 2),
    (2, 3),
    (3, 1),
    (3, 2),
    (3, 3),
    (4, 1),
    (4, 2),
    (4, 3),
    (5, 1),
    (5, 2),
    (5, 3),
    (6, 1),
    (6, 2),
    (6, 3),
    (6, 4),
    (6, 5),
    (6, 6);

-- MISSÕES

INSERT INTO Missao (Mapa, NPC, Nome, Nivel, Tipo, Cliente, Descricao, MaximoDesmaios, Tempo, Premio, Resumo, RanqueMinimo)
VALUES (2, 4, 'Caça ao Grande Jagras', 1, 0, 'Comandante', 'O Grande Jagras está ameaçando as áreas próximas. Derrote-o para garantir a segurança da região.', 3, 40, 100, 'Derrote o monstro', 1);

INSERT INTO Missao (Mapa, NPC, Nome, Nivel, Tipo, Cliente, Descricao, MaximoDesmaios, Tempo, Premio, Resumo, RanqueMinimo)
VALUES (2, 4, 'Caça ao Kulu-Ya-Ku e ao Barroth', 2, 0, 'Gerente de Acampamento', 'Um Kulu-Ya-Ku e um Barroth estão causando problemas na região. Sua missão é encontrar estes dois monstros e eliminá-los para garantir a segurança.', 3, 40, 120, 'Derrote os dois monstros', 2);

INSERT INTO Missao (Mapa, NPC, Nome, Nivel, Tipo, Cliente, Descricao, MaximoDesmaios, Tempo, Premio, Resumo, RanqueMinimo)
VALUES (2, 4, 'Caça ao Jyuratodus e ao Rathalos', 2, 0, 'Chefe dos Pesquisadores', 'Um Jyuratodus e um Rathalos estão causando problemas na região. Sua missão é encontrar estes dois monstros e eliminá-los para garantir a segurança.', 3, 45, 150, 'Derrote os dois monstros', 3);

INSERT INTO Missao (Mapa, NPC, Nome, Nivel, Tipo, Cliente, Descricao, MaximoDesmaios, Tempo, Premio, Resumo, RanqueMinimo)
VALUES (2, 4, 'Caça ao Anjanath', 3, 0, 'Botânico', 'Três Anjanaths estão representando uma ameaça à região. Sua tarefa é eliminar esses monstros e restaurar a paz.', 3, 50, 200, 'Derrote os 3 monstros', 4);

-- Missões Pre Req
INSERT INTO MissaoPreReq (MissaoPreReq, Missao) VALUES
(1, 2), (1, 3), (1, 4), (2, 4), (3, 4);

-- ETAPAS MISSOES

-- Missão: Caça ao Grande Jagras
INSERT INTO EtapaMissao (Missao, Nome, Descricao)
VALUES 
    (1, 'Encontrar Rastros', 'Investigue a área em busca de rastros do Grande Jagras.'),
    (1, 'Localizar o Monstro', 'Use os rastros para rastrear e encontrar a localização do Grande Jagras.'),
    (1, 'Caçar o Grande Jagras', 'Enfrente o Grande Jagras e derrote-o para completar a missão.');

-- Missão: Caça ao Kulu-Ya-Ku e ao Barroth
INSERT INTO EtapaMissao (Missao, Nome, Descricao)
VALUES 
    (2, 'Localizar Kulu-Ya-Ku', 'Investigue a área em busca de pistas sobre a localização do Kulu-Ya-Ku.'),
    (2, 'Localizar Barroth', 'Rastreie o Barroth e descubra sua localização.'),
    (2, 'Caçar Kulu-Ya-Ku e Barroth', 'Enfrente e derrote tanto o Kulu-Ya-Ku quanto o Barroth para completar a missão.');

-- Missão: Caça ao Jyuratodus e ao Rathalos
INSERT INTO EtapaMissao (Missao, Nome, Descricao)
VALUES 
    (3, 'Localizar Jyuratodus', 'Investigue a área em busca de pistas sobre a localização do Jyuratodus.'),
    (3, 'Localizar Rathalos', 'Rastreie o Rathalos e descubra sua localização.'),
    (3, 'Caçar Jyuratodus e Rathalos', 'Enfrente e derrote tanto o Jyuratodus quanto o Rathalos para completar a missão.');

-- Missão: Caça ao Anjanath
INSERT INTO EtapaMissao (Missao, Nome, Descricao)
VALUES 
    (4, 'Investigar Avistamentos', 'Recolha informações sobre os avistamentos dos Anjanaths na região.'),
    (4, 'Localizar Anjanaths', 'Use as informações coletadas para encontrar a localização dos Anjanaths.'),
    (4, 'Caçar os Anjanaths', 'Enfrente e derrote os três Anjanaths para completar a missão.');

-- ETAPA MONSTRO

-- Missão: Caça ao Kulu-Ya-Ku e ao Barroth
-- Etapa 1
INSERT INTO EtapaMonstro (EtapaMissao, Monstro, Quantidade)
VALUES 
    (2, 2, 1), -- Kulu-Ya-Ku
    (2, 3, 0); -- Barroth

-- Etapa 2
INSERT INTO EtapaMonstro (EtapaMissao, Monstro, Quantidade)
VALUES 
    (3, 2, 0), -- Kulu-Ya-Ku
    (3, 3, 1); -- Barroth

-- Etapa 3
INSERT INTO EtapaMonstro (EtapaMissao, Monstro, Quantidade)
VALUES 
    (4, 2, 1), -- Kulu-Ya-Ku
    (4, 3, 1); -- Barroth

-- Missão: Caça ao Jyuratodus e ao Rathalos
-- Etapa 1
INSERT INTO EtapaMonstro (EtapaMissao, Monstro, Quantidade)
VALUES 
    (5, 4, 1), -- Jyuratodus
    (5, 5, 0); -- Rathalos

-- Etapa 2
INSERT INTO EtapaMonstro (EtapaMissao, Monstro, Quantidade)
VALUES 
    (6, 4, 0), -- Jyuratodus
    (6, 5, 1); -- Rathalos

-- Etapa 3
INSERT INTO EtapaMonstro (EtapaMissao, Monstro, Quantidade)
VALUES 
    (7, 4, 1), -- Jyuratodus
    (7, 5, 1); -- Rathalos

-- Missão: Caça ao Anjanath
-- Etapa 1
INSERT INTO EtapaMonstro (EtapaMissao, Monstro, Quantidade)
VALUES 
    (8, 6, 0); -- Anjanath

-- Etapa 2
INSERT INTO EtapaMonstro (EtapaMissao, Monstro, Quantidade)
VALUES 
    (9, 6, 0); -- Anjanath

-- Etapa 3
INSERT INTO EtapaMonstro (EtapaMissao, Monstro, Quantidade)
VALUES 
    (10, 6, 3); -- Anjanath

-- LOJA

INSERT INTO Loja (NPC, Tipo)
VALUES (3, 1);

-- FORJA

INSERT INTO Forja (NPC, Tipo)
VALUES (2, 1);

-- EQUIPAMENTOS
INSERT INTO Equipamento (Categoria) VALUES
    (1), -- Categoria 1 (Itens)
    (1),  -- item
    (1), -- item
    (1), -- item
    (1), -- item 
    (1), -- item
    (2), -- Categoria 2 (Armas)
    (2), -- arma
    (2), -- arma
    (2), -- arma
    (2), -- arma
    (2), -- arma
    (3), -- Categoria 3 (Armaduras)
    (3),
    (3), 
    (3),
    (4), -- Categoria 4 (Amuletos)
    (4),
    (4),
    (4),
    (5), -- Categoria 5 (Ferramentas)
    (5),
    (5),
    (5),
    (5),
    (5);

-- ITENS
INSERT INTO Item (IdItem, Nome, Raridade, Tipo, Funcao, Descricao, ValorVenda, CustoCompra) VALUES
    (1, 'Poção de Vida', 1, 1, 'Cura', 'Cura uma pequena quantidade de vida.', 10, 5),
    (2, 'Poção de Energia', 1, 1, 'Energia', 'Restaura um pouco de energia.', 15, 8),
    (3, 'Carne Grelhada', 1, 2, 'Consumível', 'Alimento grelhado que restaura a estamina.', 20, 10),
    (4, 'Gema do Wyvern', 2, 3, 'Material', 'Gema valiosa coletada de Wyverns.', 50, 30),
    (5, 'Escama Resistente', 3, 3, 'Material', 'Escama robusta de monstros resistentes.', 30, 20),
    (6, 'Dente Afiado', 2, 3, 'Material', 'Dente afiado de monstros predadores.', 25, 15);

-- ARMAS
INSERT INTO Arma (IdArma, Nome, Nivel, Raridade, CustoCompra, ValorVenda, Descricao, Tipo, Ataque, Afiacao, Elemento, ValorElemento) VALUES
    (7, 'Espada de Ferro', 1, 1, 50, 25, 'Uma espada básica feita de ferro.', 1, 80, 30, 'None', 0),
    (8, 'Arco de Caça', 1, 1, 60, 30, 'Um arco simples para caçadores ágeis.', 2, 60, 50, 'None', 0),
    (9, 'Machado de Ferro', 1, 1, 55, 28, 'Um machado robusto, ideal para cortar monstros.', 3, 90, 20, 'None', 0),
    (10, 'Espada e Escudo de Aço', 1, 1, 70, 35, 'Uma combinação versátil de ataque e defesa.', 4, 70, 40, 'None', 0),
    (11, 'Lança de Ferro', 1, 1, 65, 32, 'Uma lança longa e resistente.', 5, 75, 35, 'None', 0),
    (12, 'Martelo de Osso', 1, 1, 75, 38, 'Um martelo pesado para esmagar inimigos.', 6, 100, 25, 'None', 0);

-- ARMADURAS

INSERT INTO Armadura (IdArmadura, Nome, Nivel, Raridade, CustoCompra, ValorVenda, Descricao, Tipo, Defesa, Fogo, Agua, Raio, Gelo, Dragao) VALUES
    (13, 'Armadura de Couro', 1, 1, 40, 20, 'Uma armadura básica feita de couro resistente.', 1, 30, 0, 0, 0, 0, 0),
    (14, 'Armadura de Placas', 1, 1, 50, 25, 'Uma armadura reforçada com placas de metal.', 2, 40, 0, 0, 0, 0, 0),
    (15, 'Armadura de Escamas', 1, 1, 45, 22, 'Uma armadura feita de escamas de monstros resistentes.', 3, 35, 0, 0, 0, 0, 0),
    (16, 'Armadura de Ferro', 1, 1, 55, 28, 'Uma armadura resistente feita de ferro forjado.', 4, 50, 0, 0, 0, 0, 0);

-- AMULETOS

-- Inserções para a tabela Amuleto
INSERT INTO Amuleto (IdAmuleto, Nome, Nivel, Raridade, CustoCompra, ValorVenda, Descricao, Tipo, Melhoria) VALUES
    (17, 'Amuleto da Vitalidade', 1, 1, 30, 15, 'Aumenta a vitalidade do caçador.', 1, 10),
    (18, 'Amuleto do Ataque', 1, 1, 35, 18, 'Aumenta o poder de ataque do caçador.', 2, 15),
    (19, 'Amuleto da Resistência', 1, 1, 40, 20, 'Aumenta a resistência do caçador a efeitos adversos.', 3, 20),
    (20, 'Amuleto do Elemento', 1, 1, 45, 22, 'Aumenta o poder do elemento da arma do caçador.', 4, 10);

-- FERRAMENTAS

INSERT INTO Ferramenta (IdFerramenta, Nome, Nivel, Raridade, CustoCompra, ValorVenda, Descricao, Tipo, Funcao, TempoEfeito, TempoRecarga) VALUES
    (21, 'Mega Poção', 1, 1, 25, 12, 'Cura uma grande quantidade de vida.', 1, 'Cura', 30, 15),
    (22, 'Flash Pod', 1, 1, 20, 10, 'Um pod que cega temporariamente monstros voadores.', 2, 'Controle', 20, 10),
    (23, 'Isca de Carne', 1, 1, 15, 8, 'Isca atrativa para monstros carnívoros.', 3, 'Atração', 15, 5),
    (24, 'Mega Nutriente', 1, 1, 30, 15, 'Aumenta temporariamente a resistência máxima do caçador.', 4, 'Bônus', 30, 20),
    (25, 'Ghillie Mantle', 1, 1, 40, 20, 'Camufla o caçador, tornando-o temporariamente invisível para os monstros.', 5, 'Invisibilidade', 60, 40),
    (26, 'Bomba de Fumaça', 1, 1, 15, 8, 'Cria uma nuvem de fumaça que oculta o caçador dos monstros.', 6, 'Invisibilidade', 30, 15);


-- VENDE EQUIPAMENTO

INSERT INTO VendeEquipamento (Loja, Equipamento) VALUES
    (1, 7),
    (1, 8),
    (1, 9),
    (1, 10),
    (1, 11),
    (1, 12),
    (1, 17),
    (1, 18),
    (1, 19),
    (1, 20),
    (1, 21),
    (1, 22),
    (1, 23),
    (1, 24),
    (1, 25),
    (1, 26);

-- CRIA EQUIPAMENTO

INSERT INTO CriaEquipamento (Forja, Equipamento) VALUES
    (1, 13),
    (1, 14),
    (1, 15),
    (1, 16);

-- DROPA ITEM

INSERT INTO DropaItem (Monstro, Item) VALUES
    (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6);

-- HABILIDADES

INSERT INTO Habilidade (Nome, Nivel, Descricao, Funcao) VALUES
    ('Ataque Afiado', 1, 'Aumenta a afiação da arma, permitindo cortes mais eficientes.', 'Melhoria de Ataque'),
    ('Esquiva Rápida', 1, 'Melhora a habilidade de esquivar dos ataques inimigos.', 'Defesa Pessoal'),
    ('Furtividade', 1, 'Reduz a probabilidade de ser detectado por monstros.', 'Invisibilidade'),
    ('Ataque Elementar', 1, 'Aumenta o dano dos ataques elementares.', 'Melhoria de Ataque'),
    ('Resistência a Status', 1, 'Aumenta a resistência a efeitos adversos como veneno e paralisia.', 'Defesa Pessoal'),
    ('Rastreamento de Monstros', 1, 'Facilita o rastreamento de monstros no ambiente.', 'Exploração'),
    ('Foco', 1, 'Aumenta a rapidez com que a energia é carregada para habilidades especiais.', 'Melhoria de Habilidade'),
    ('Vigor Ilimitado', 1, 'Aumenta a resistência e reduz o consumo de estamina.', 'Melhoria de Resistência');

-- HabilidadeAmuleto
INSERT INTO HabilidadeAmuleto (Amuleto, Habilidade)
VALUES
  (17, 1), 
  (18, 2),
  (19, 3),
  (20, 4);

-- HabilidadeArmadura
INSERT INTO HabilidadeArmadura (Armadura, Habilidade)
VALUES
  (13, 5), 
  (14, 6),
  (15, 7),
  (16, 8);
```
