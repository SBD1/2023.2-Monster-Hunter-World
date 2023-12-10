BEGIN;

-- Inserção de dados para a tabela Mapa
INSERT INTO Mapa (IdMapa, Nome, Descricao)
VALUES 
  (1, 'Astera', 'Principal base dos caçadores, uma cidade movimentada com várias instalações essenciais.'),
  (2, 'Ancient Forest', 'Floresta exuberante com variedade de ecossistemas e monstros.'),
  (3, 'Wildspire Waste', 'Deserto vasto e quente, lar de criaturas adaptadas ao clima árido.'),
  (4, 'Coral Highlands', 'Região elevada coberta por corais, com uma paisagem deslumbrante.'),
  (5, 'Rotten Vale', 'Área sombria e contaminada, com carcaças de monstros e atmosfera perigosa.'),
  (6, 'Elder''s Recess', 'Área vulcânica e instável que abriga monstros poderosos.'),
  (7, 'Hoarfrost Reach', 'Mapa coberto de neve e gelo introduzido na expansão "Iceborne".');

-- Inserção de dados para a tabela Regiao
INSERT INTO Regiao (IdRegiao, Mapa, Nome, Descricao)
VALUES 
  (1, 1, 'Área Central de Astera', 'O coração da cidade, onde os jogadores podem encontrar a Praça Principal, o Mercado, o Centro de Comando e outros estabelecimentos importantes.'),
  (2, 1, 'Oficina do Ferreiro', 'Local onde os jogadores podem forjar e melhorar seus equipamentos.'),
  (3, 1, 'Canteiro de Botânicos', 'Área dedicada ao cultivo de itens e gestão de recursos.'),
  (4, 1, 'Quartel', 'Local onde os jogadores podem se reunir com outros caçadores, recrutar ajudantes e acessar missões multiplayer.'),
  (5, 1, 'Galeria de Caça', 'Exibe informações sobre monstros encontrados e abatidos pelos jogadores.'),
  (6, 1, 'Sala de Reuniões', 'Local para planejar missões, se reunir com outros caçadores e acessar a Tabela de Missões.'),
  (7, 2, 'Acampamento Base', 'Vale Norte, Floresta Antiga'),
  (8, 2, 'Acampamento Central', 'Vale Sul, Floresta Antiga'),
  (9, 2, 'Acampamento Árvore', 'Vale Central, Floresta Antiga'),
  (10, 2, 'Vale Norte', 'Área densamente arborizada na Floresta Antiga.'),
  (11, 2, 'Vale Sul', 'Uma área de vales e rios na Floresta Antiga.'),
  (12, 2, 'Vale Central', 'Região central com uma árvore maciça na Floresta Antiga.'),
  (13, 2, 'Área de Anjanath', 'Habitat do Anjanath na Floresta Antiga.'),
  (14, 2, 'Área de Rathalos', 'Habitat do Rathalos na Floresta Antiga.'),
  (15, 2, 'Área de Rathian', 'Habitat do Rathian na Floresta Antiga.'),
  (16, 2, 'Área de Tobi-Kadachi', 'Habitat do Tobi-Kadachi na Floresta Antiga.'),
  (17, 2, 'Área de Great Jagras', 'Habitat do Great Jagras na Floresta Antiga.'),
  (18, 3, 'Acampamento Oásis', 'Oásis, Deserto Ardente'),
  (19, 3, 'Acampamento Deserto', 'Planícies de Areia, Deserto Ardente'),
  (20, 3, 'Acampamento Rochoso', 'Área de Diablos, Deserto Ardente'),
  (21, 3, 'Planícies de Areia', 'Extensas áreas de areia no Deserto Ardente.'),
  (22, 3, 'Área de Diablos', 'Habitat do Diablos no Deserto Ardente.'),
  (23, 3, 'Área de Rathian', 'Habitat do Rathian no Deserto Ardente.'),
  (24, 3, 'Oásis', 'Uma área com água e vegetação no Deserto Ardente.'),
  (25, 3, 'Pântano de Ácido', 'Uma área perigosa com lama ácida no Deserto Ardente.'),
  (26, 4, 'Acampamento Legiana', 'Área de Legiana, Terras Altas Coral'),
  (27, 4, 'Acampamento Paolumu', 'Área de Paolumu, Terras Altas Coral'),
  (28, 4, 'Acampamento Tzitzi', 'Área de Tzitzi-Ya-Ku, Terras Altas Coral'),
  (29, 4, 'Área de Legiana', 'Habitat do Legiana nas Terras Altas Coral.'),
  (30, 4, 'Área de Paolumu', 'Habitat do Paolumu nas Terras Altas Coral.'),
  (31, 4, 'Área de Tzitzi-Ya-Ku', 'Habitat do Tzitzi-Ya-Ku nas Terras Altas Coral.'),
  (32, 4, 'Ninhos Superiores', 'Áreas elevadas com ecossistemas únicos nas Terras Altas Coral.'),
  (33, 5, 'Acampamento Girros', 'Área de Great Girros, Vale Apodrecido'),
  (34, 5, 'Acampamento Odogaron', 'Área de Odogaron, Vale Apodrecido'),
  (35, 5, 'Acampamento Radobaan', 'Área de Radobaan, Vale Apodrecido'),
  (36, 5, 'Área de Great Girros', 'Habitat do Great Girros no Vale Apodrecido.'),
  (37, 5, 'Área de Odogaron', 'Habitat do Odogaron no Vale Apodrecido.'),
  (38, 5, 'Área de Radobaan', 'Habitat do Radobaan no Vale Apodrecido.'),
  (39, 5, 'Covil da Morte', 'Uma área com carcaças em decomposição no Vale Apodrecido.'),
  (40, 6, 'Acampamento Nergigante', 'Área de Nergigante, Ninho do Ancião'),
  (41, 6, 'Acampamento Teostra', 'Área de Teostra, Ninho do Ancião'),
  (42, 6, 'Acampamento Vaal Hazak', 'Área de Vaal Hazak, Ninho do Ancião'),
  (43, 6, 'Acampamento Kushala', 'Área de Kushala Daora, Ninho do Ancião'),
  (44, 6, 'Área de Nergigante', 'Habitat do Nergigante no Ninho do Ancião.'),
  (45, 6, 'Área de Teostra', 'Habitat do Teostra no Ninho do Ancião.'),
  (46, 6, 'Área de Vaal Hazak', 'Habitat do Vaal Hazak no Ninho do Ancião.'),
  (47, 6, 'Área de Kushala Daora', 'Habitat do Kushala Daora no Ninho do Ancião.'),
  (48, 7, 'Acampamento Beotodus', 'Área de Beotodus, Gélido Extremo'),
  (49, 7, 'Acampamento Banbaro', 'Área de Banbaro, Gélido Extremo'),
  (50, 7, 'Acampamento Picos Gelados', 'Picos Gelados, Gélido Extremo'),
  (51, 7, 'Base Seliana', 'Introduzida em Iceborne, é a nova base dos caçadores no Gélido Extremo.'),
  (52, 7, 'Planalto do Ancião', 'Uma área de terreno elevado no Gélido Extremo.'),
  (53, 7, 'Área de Beotodus', 'Habitat do Beotodus no Gélido Extremo.'),
  (54, 7, 'Área de Banbaro', 'Habitat do Banbaro no Gélido Extremo.'),
  (55, 7, 'Picos Gelados', 'Áreas com terreno acidentado e nevasca no Gélido Extremo.'),
  (56, 7, 'Acampamento Base Seliana', 'Base Seliana, Gélido Extremo'),
  (57, 7, 'Acampamento Planalto', 'Planalto do Ancião, Gélido Extremo');

-- Astera
INSERT INTO LevaEm (RegiaoOrigem, RegiaoDestino) VALUES
  (1, 2), -- Área Central de Astera -> Oficina do Ferreiro
  (1, 3), -- Área Central de Astera -> Canteiro de Botânicos
  (1, 4), -- Área Central de Astera -> Quartel
  (1, 5), -- Área Central de Astera -> Galeria de Caça
  (1, 6), -- Área Central de Astera -> Sala de Reuniões
  (2, 1), -- Oficina do Ferreiro -> Área Central de Astera
  (3, 1), -- Canteiro de Botânicos -> Área Central de Astera
  (4, 1), -- Quartel -> Área Central de Astera
  (5, 1), -- Galeria de Caça -> Área Central de Astera
  (6, 1); -- Sala de Reuniões -> Área Central de Astera

-- Floresta Antiga
INSERT INTO LevaEm (RegiaoOrigem, RegiaoDestino) VALUES
  (7, 10), -- Acampamento Base -> Vale Norte
  (8, 11), -- Acampamento Central -> Vale Sul
  (9, 12), -- Acampamento Árvore -> Vale Central
  (10, 13), -- Vale Norte -> Área de Anjanath
  (11, 14), -- Vale Sul -> Área de Rathalos
  (12, 15), -- Vale Central -> Área de Rathian
  (13, 16), -- Área de Anjanath -> Área de Tobi-Kadachi
  (14, 17), -- Área de Rathalos -> Área de Great Jagras
  (15, 17), -- Área de Rathian -> Área de Great Jagras
  (16, 17), -- Área de Tobi-Kadachi -> Área de Great Jagras
  (17, 10), -- Área de Great Jagras -> Vale Norte
  (17, 11), -- Área de Great Jagras -> Vale Sul
  (17, 12), -- Área de Great Jagras -> Vale Central
  (10, 7), -- Vale Norte -> Acampamento Base
  (11, 8), -- Vale Sul -> Acampamento Central
  (12, 9); -- Vale Central -> Acampamento Árvore

-- Deserto Ardente
INSERT INTO LevaEm (RegiaoOrigem, RegiaoDestino) VALUES
  (18, 21), -- Acampamento Oásis -> Planícies de Areia
  (19, 21), -- Acampamento Deserto -> Planícies de Areia
  (20, 21), -- Acampamento Rochoso -> Planícies de Areia
  (21, 22), -- Planícies de Areia -> Área de Diablos
  (22, 23), -- Área de Diablos -> Área de Rathian
  (23, 24), -- Área de Rathian -> Oásis
  (24, 25), -- Oásis -> Pântano de Ácido
  (25, 24), -- Pântano de Ácido -> Oásis
  (25, 25), -- Pântano de Ácido -> Pântano de Ácido
  (21, 18), -- Planícies de Areia -> Acampamento Oásis
  (21, 19), -- Planícies de Areia -> Acampamento Deserto
  (21, 20), -- Planícies de Areia -> Acampamento Rochoso
  (22, 21), -- Área de Diablos -> Planícies de Areia
  (23, 22), -- Área de Rathian -> Área de Diablos
  (24, 23); -- Oásis -> Área de Rathian

-- Terras Altas Coral
INSERT INTO LevaEm (RegiaoOrigem, RegiaoDestino) VALUES
  (26, 29), -- Acampamento Legiana -> Área de Legiana
  (27, 30), -- Acampamento Paolumu -> Área de Paolumu
  (28, 31), -- Acampamento Tzitzi -> Área de Tzitzi-Ya-Ku
  (29, 32), -- Área de Legiana -> Ninhos Superiores
  (30, 32), -- Área de Paolumu -> Ninhos Superiores
  (31, 32), -- Área de Tzitzi-Ya-Ku -> Ninhos Superiores
  (32, 29), -- Ninhos Superiores -> Área de Legiana
  (32, 30), -- Ninhos Superiores -> Área de Paolumu
  (32, 31), -- Ninhos Superiores -> Área de Tzitzi-Ya-Ku
  (29, 26), -- Área de Legiana -> Acampamento Legiana
  (30, 27), -- Área de Paolumu -> Acampamento Paolumu
  (31, 28); -- Área de Tzitzi-Ya-Ku -> Acampamento Tzitzi

-- Vale Apodrecido
INSERT INTO LevaEm (RegiaoOrigem, RegiaoDestino) VALUES
  (33, 36), -- Acampamento Girros -> Área de Great Girros
  (34, 37), -- Acampamento Odogaron -> Área de Odogaron
  (35, 38), -- Acampamento Radobaan -> Área de Radobaan
  (36, 39), -- Área de Great Girros -> Covil da Morte
  (37, 39), -- Área de Odogaron -> Covil da Morte
  (38, 39), -- Área de Radobaan -> Covil da Morte
  (39, 36), -- Covil da Morte -> Área de Great Girros
  (39, 37), -- Covil da Morte -> Área de Odogaron
  (39, 38), -- Covil da Morte -> Área de Radobaan
  (36, 33), -- Área de Great Girros -> Acampamento Girros
  (37, 34), -- Área de Odogaron -> Acampamento Odogaron
  (38, 35); -- Área de Radobaan -> Acampamento Radobaan

-- Ninho do Ancião
INSERT INTO LevaEm (RegiaoOrigem, RegiaoDestino) VALUES
  (40, 44), -- Acampamento Nergigante -> Área de Nergigante
  (41, 45), -- Acampamento Teostra -> Área de Teostra
  (42, 46), -- Acampamento Vaal Hazak -> Área de Vaal Hazak
  (43, 47), -- Acampamento Kushala -> Área de Kushala Daora
  (44, 40), -- Área de Nergigante -> Acampamento Nergigante
  (45, 41), -- Área de Teostra -> Acampamento Teostra
  (46, 42), -- Área de Vaal Hazak -> Acampamento Vaal Hazak
  (47, 43), -- Área de Kushala Daora -> Acampamento Kushala
  (44, 45), -- Área de Nergigante -> Área de Teostra
  (45, 46), -- Área de Teostra -> Área de Vaal Hazak
  (46, 47), -- Área de Vaal Hazak -> Área de Kushala Daora
  (47, 44), -- Área de Kushala Daora -> Área de Nergigante
  (44, 40), -- Área de Nergigante -> Acampamento Nergigante
  (45, 41), -- Área de Teostra -> Acampamento Teostra
  (46, 42), -- Área de Vaal Hazak -> Acampamento Vaal Hazak
  (47, 43), -- Área de Kushala Daora -> Acampamento Kushala
  (40, 40), -- Acampamento Nergigante -> Acampamento Nergigante
  (41, 41), -- Acampamento Teostra -> Acampamento Teostra
  (42, 42), -- Acampamento Vaal Hazak -> Acampamento Vaal Hazak
  (43, 43), -- Acampamento Kushala -> Acampamento Kushala
  (44, 44), -- Área de Nergigante -> Área de Nergigante
  (45, 45); -- Área de Teostra -> Área de Teostra


-- Gélido Extremo
INSERT INTO LevaEm (RegiaoOrigem, RegiaoDestino) VALUES
  (48, 53), -- Acampamento Beotodus -> Área de Beotodus
  (49, 54), -- Acampamento Banbaro -> Área de Banbaro
  (50, 55), -- Acampamento Picos Gelados -> Picos Gelados
  (51, 56), -- Base Seliana -> Acampamento Base Seliana
  (52, 57), -- Planalto do Ancião -> Acampamento Planalto
  (53, 57), -- Área de Beotodus -> Acampamento Planalto
  (54, 57), -- Área de Banbaro -> Acampamento Planalto
  (55, 57), -- Picos Gelados -> Acampamento Planalto
  (56, 56), -- Acampamento Base Seliana -> Base Seliana
  (57, 57), -- Acampamento Planalto -> Planalto do Ancião
  (53, 48), -- Área de Beotodus -> Acampamento Beotodus
  (54, 49), -- Área de Banbaro -> Acampamento Banbaro
  (55, 50), -- Picos Gelados -> Acampamento Picos Gelados
  (56, 51), -- Acampamento Base Seliana -> Base Seliana
  (57, 52), -- Acampamento Planalto -> Planalto do Ancião
  (53, 54), -- Área de Beotodus -> Área de Banbaro
  (53, 55), -- Área de Beotodus -> Picos Gelados
  (53, 56), -- Área de Beotodus -> Acampamento Base Seliana
  (53, 57), -- Área de Beotodus -> Acampamento Planalto
  (54, 53), -- Área de Banbaro -> Área de Beotodus
  (54, 55), -- Área de Banbaro -> Picos Gelados
  (54, 56), -- Área de Banbaro -> Acampamento Base Seliana
  (54, 57), -- Área de Banbaro -> Acampamento Planalto
  (55, 53), -- Picos Gelados -> Área de Beotodus
  (55, 54), -- Picos Gelados -> Área de Banbaro
  (55, 56), -- Picos Gelados -> Acampamento Base Seliana
  (55, 57), -- Picos Gelados -> Acampamento Planalto
  (56, 53), -- Acampamento Base Seliana -> Área de Beotodus
  (56, 54), -- Acampamento Base Seliana -> Área de Banbaro
  (56, 55), -- Acampamento Base Seliana -> Picos Gelados
  (56, 57), -- Acampamento Base Seliana -> Acampamento Planalto
  (57, 53), -- Acampamento Planalto -> Área de Beotodus
  (57, 54), -- Acampamento Planalto -> Área de Banbaro
  (57, 55), -- Acampamento Planalto -> Picos Gelados
  (57, 56); -- Acampamento Planalto -> Acampamento Base Seliana

-- Área Central de Astera
INSERT INTO NPC (IdNPC, Regiao, Nome, Descricao, Funcao, Raca, Genero) VALUES 
    (1, 1, 'Comandante', 'Líder da Comissão de Caçadores.', 'tutorial', 'humano', 'masculino'),
    (2, 1, 'Feiticeira', 'Gerencia a Loja Provisions e fornece missões opcionais.', 'loja', 'humano', 'feminino');

-- Oficina do Ferreiro
INSERT INTO NPC (IdNPC, Regiao, Nome, Descricao, Funcao, Raca, Genero) VALUES 
    (3, 1, 'Ferreiro', 'Responsável por forjar e melhorar equipamentos.', 'forja', 'humano', 'masculino'),
    (4, 1, 'Vendedor de Armas', 'Oferece uma variedade de armas para compra.', 'loja', 'humano', 'masculino');

-- Canteiro de Botânicos
INSERT INTO NPC (IdNPC, Regiao, Nome, Descricao, Funcao, Raca, Genero) VALUES 
    (5, 1, 'Botânicos', 'Gerenciam o cultivo de itens.', 'npc', 'humano', 'ambos');

-- Quartel
INSERT INTO NPC (IdNPC, Regiao, Nome, Descricao, Funcao, Raca, Genero) VALUES 
    (6, 1, 'Assistente', 'Coordena as missões e informações gerais.', 'assistente', 'npc', 'ambos'),
    (7, 1, 'Comandante', 'Pode ser encontrado aqui, além de outros caçadores e NPCs.', 'npc', 'humano', 'masculino');

-- Galeria de Caça
INSERT INTO NPC (IdNPC, Regiao, Nome, Descricao, Funcao, Raca, Genero) VALUES 
    (8, 1, 'Ecóloga', 'Fornece informações detalhadas sobre monstros.', 'npc', 'humano', 'feminino'),
    (9, 1, 'Biólogo', 'Mantém registros de monstros derrotados.', 'npc', 'humano', 'ambos');

-- Sala de Reuniões
INSERT INTO NPC (IdNPC, Regiao, Nome, Descricao, Funcao, Raca, Genero) VALUES 
    (10, 1, 'Assistente', 'Pode ser encontrada aqui para atribuir missões principais.', 'assistente', 'humano', 'feminino'),
    (11, 1, 'Mestre do Canteiro', 'Gerencia o Canteiro de Botânicos.', 'npc', 'humano', 'masculino');

-- NPCs para Acampamentos
INSERT INTO NPC (IdNPC, Regiao, Nome, Descricao, Funcao, Raca, Genero) VALUES 
    (12, 7, 'Assistente de Missão - Acampamento Base', 'Auxilia os caçadores na gestão de missões no Acampamento Base.', 'AssistenteMissao', 'humano', 'feminino'),
    (13, 8, 'Assistente de Missão - Acampamento Central', 'Auxilia os caçadores na gestão de missões no Acampamento Central.', 'AssistenteMissao', 'humano', 'feminino'),
    (14, 9, 'Assistente de Missão - Acampamento Árvore', 'Auxilia os caçadores na gestão de missões no Acampamento Árvore.', 'AssistenteMissao', 'humano', 'feminino'),
    (15, 18, 'Assistente de Missão - Acampamento Oásis', 'Auxilia os caçadores na gestão de missões no Acampamento Oásis.', 'AssistenteMissao', 'humano', 'feminino'),
    (16, 19, 'Assistente de Missão - Acampamento Deserto', 'Auxilia os caçadores na gestão de missões no Acampamento Deserto.', 'AssistenteMissao', 'humano', 'feminino'),
    (17, 20, 'Assistente de Missão - Acampamento Rochoso', 'Auxilia os caçadores na gestão de missões no Acampamento Rochoso.', 'AssistenteMissao', 'humano', 'feminino'),
    (18, 26, 'Assistente de Missão - Acampamento Legiana', 'Auxilia os caçadores na gestão de missões no Acampamento Legiana.', 'AssistenteMissao', 'humano', 'feminino'),
    (19, 27, 'Assistente de Missão - Acampamento Paolumu', 'Auxilia os caçadores na gestão de missões no Acampamento Paolumu.', 'AssistenteMissao', 'humano', 'feminino'),
    (20, 28, 'Assistente de Missão - Acampamento Tzitzi', 'Auxilia os caçadores na gestão de missões no Acampamento Tzitzi.', 'AssistenteMissao', 'humano', 'feminino'),
    (21, 33, 'Assistente de Missão - Acampamento Girros', 'Auxilia os caçadores na gestão de missões no Acampamento Girros.', 'AssistenteMissao', 'humano', 'feminino'),
    (22, 34, 'Assistente de Missão - Acampamento Odogaron', 'Auxilia os caçadores na gestão de missões no Acampamento Odogaron.', 'AssistenteMissao', 'humano', 'feminino'),
    (23, 35, 'Assistente de Missão - Acampamento Radobaan', 'Auxilia os caçadores na gestão de missões no Acampamento Radobaan.', 'AssistenteMissao', 'humano', 'feminino'),
    (24, 40, 'Assistente de Missão - Acampamento Nergigante', 'Auxilia os caçadores na gestão de missões no Acampamento Nergigante.', 'AssistenteMissao', 'humano', 'feminino'),
    (25, 41, 'Assistente de Missão - Acampamento Teostra', 'Auxilia os caçadores na gestão de missões no Acampamento Teostra.', 'AssistenteMissao', 'humano', 'feminino'),
    (26, 42, 'Assistente de Missão - Acampamento Vaal Hazak', 'Auxilia os caçadores na gestão de missões no Acampamento Vaal Hazak.', 'AssistenteMissao', 'humano', 'feminino'),
    (27, 43, 'Assistente de Missão - Acampamento Kushala', 'Auxilia os caçadores na gestão de missões no Acampamento Kushala.', 'AssistenteMissao', 'humano', 'feminino'),
    (28, 48, 'Assistente de Missão - Acampamento Beotodus', 'Auxilia os caçadores na gestão de missões no Acampamento Beotodus.', 'AssistenteMissao', 'humano', 'feminino'),
    (29, 49, 'Assistente de Missão - Acampamento Banbaro', 'Auxilia os caçadores na gestão de missões no Acampamento Banbaro.', 'AssistenteMissao', 'humano', 'feminino'),
    (30, 50, 'Assistente de Missão - Acampamento Picos Gelados', 'Auxilia os caçadores na gestão de missões no Acampamento Picos Gelados.', 'AssistenteMissao', 'humano', 'feminino'),
    (31, 56, 'Assistente de Missão - Acampamento Base Seliana', 'Auxilia os caçadores na gestão de missões no Acampamento Base Seliana.', 'AssistenteMissao', 'humano', 'feminino'),
    (32, 57, 'Assistente de Missão - Acampamento Planalto', 'Auxilia os caçadores na gestão de missões no Acampamento Planalto.', 'AssistenteMissao', 'humano', 'feminino');

-- FALAS
INSERT INTO Fala (IdFala, NPC, Fala, Repetivel, FoiExecutado)
VALUES 
    (1, 1, 'Bem-vindo, intrépido caçador, ao Novo Mundo, um reino vasto e misterioso repleto de criaturas lendárias e desafios épicos.', true, false),
    (2, 1, 'Este continente inexplorado é o palco de suas caçadas, onde terras exuberantes e perigosas aguardam por sua exploração. Astera, nossa base central, é o ponto de partida para suas aventuras, cercada por ecossistemas diversificados e habitats impressionantes.', true, false),
    (3, 1, 'Aqui em Astera, você se tornará parte de uma guilda de elite de caçadores, encarregada de enfrentar criaturas colossais que dominam o Novo Mundo. Sua missão? Desbravar, caçar e se tornar um verdadeiro mestre na arte da caçada.', true, false),
    (4, 1, 'Primeiro, familiarize-se com Astera, a nossa base central. Caminhe pelas ruas, converse com outros caçadores na Sala de Encontros e, quando estiver pronto para a ação, dirija-se ao Salão de Missões para desafios empolgantes.', false, false),
    (5, 1, 'À sua disposição estão a Loja, onde você pode adquirir equipamentos cruciais, e a Forja, onde aprimorará suas armas e armaduras para os desafios que virão. A preparação é a chave para o sucesso.', true, false),
    (6, 1, 'Nas vastas planícies e florestas densas, você encontrará monstros colossais, cada um com sua própria ecologia e comportamento. Cada caçada é uma jornada única, uma batalha contra a natureza selvagem que molda o Novo Mundo.', true, false),
    (7, 1, 'Não se limite a caçar apenas pelas recompensas, mas também pela descoberta. Ruínas antigas, ecossistemas interconectados e segredos ocultos aguardam aqueles que ousam explorar. Mantenha os olhos abertos e esteja preparado para se maravilhar com a grandiosidade deste mundo.', true, false),
    (8, 1, 'Parta agora para as terras desconhecidas, caçador! Seu objetivo é grandioso, mas lembre-se, cada passo que você dá, cada monstro que enfrenta, molda a lenda que está destinado a se tornar. Boa sorte em suas caçadas, que sejam verdadeiramente lendárias!', true, false),
    (9, 2, 'Olá! Eu sou a Feiticeira. Se precisar de suprimentos, estou aqui para ajudar. Também posso oferecer algumas missões opcionais. Dê uma olhada na Loja Provisions!', true, false),
    (10, 3, 'E aí, caçador(a)! Eu sou o Ferreiro. Se quiser melhorar ou forjar equipamentos, você veio ao lugar certo. Mostre-me suas peças e vamos criar algo incrível!', true, false),
    (11, 4, 'Ei, caçador(a)! Precisa de uma arma nova? Aqui é o lugar certo. Dê uma olhada na minha seleção. Se precisar de conselhos, estou à disposição.', true, false),
    (12, 5, 'Olá, caçador(a)! Nós somos os Botânicos. Se precisar de recursos naturais ou quiser cultivar itens, você está no Canteiro certo. Cuidaremos das suas plantas!', true, false),
    (13, 6, 'Bem-vindo(a) ao Quartel! Eu sou o(a) Assistente. Aqui você pode reunir-se com outros caçadores, recrutar ajudantes e acessar missões multiplayer. Alguma dúvida? Estou aqui!', true, false),
    (14, 7, 'Oi, caçador(a)! Sou a Ecóloga. Se quiser informações detalhadas sobre os monstros que encontrou, estou aqui para ajudar. Sempre é bom conhecer bem o inimigo, não é?', true, false),
    (15, 8, 'Saudações, caçador(a)! Mantenho registros dos monstros que você derrotou. Se quiser conferir suas conquistas ou buscar informações sobre as bestas, estou à disposição.', true, false),
    (16, 9, 'Olá! Eu sou o(a) Assistente da Sala de Reuniões. Precisa de alguma orientação sobre missões principais? Estou aqui para ajudar. Planejamento é a chave para o sucesso!', true, false),
    (17, 10, 'Cumprimentos, caçador(a)! Sou o Mestre do Canteiro. Se precisar de recursos cultivados ou quiser gerenciar o Canteiro de Botânicos, estou aqui para garantir que tudo esteja em ordem.', true, false),
    (18, 11, 'Ah, outro caçador(a) se junta às nossas fileiras. Eu sou o Comandante, líder da Comissão. Sua coragem é essencial. Consulte-me para missões principais e contribua para a prosperidade de Astera!', true, false),
    (19, 12, 'Olá, caçador(a)! Se precisar encerrar sua expedição, estou aqui para ajudar. É só me chamar quando estiver pronto(a) para voltar. Boa caçada!', true, false),
    (20, 13, 'Oi, caçador(a)! Quando quiser encerrar sua expedição, estou aqui para ajudar. É só me procurar quando estiver pronto(a) para voltar. Boa caçada!', true, false),
    (21, 14, 'Saudações, caçador(a)! Se quiser encerrar sua expedição, estou aqui para ajudar. É só me procurar quando estiver pronto(a) para voltar. Boa caçada!', true, false),
    (22, 15, 'Brrr, está congelando por aí? Quando quiser voltar, estou aqui para ajudar. Me chame quando estiver pronto(a) para retornar da expedição. Boa caçada!', true, false),
    (23, 16, 'Olá, caçador(a)! Quando estiver pronto(a) para retornar da expedição, estarei aqui para ajudar. É só me chamar. Boa caçada!', true, false),
    (24, 17, 'Olá, caçador(a)! Estou aqui para ajudar com suas missões. Quando estiver pronto(a) para retornar da expedição, basta me procurar. Boa caçada!', true, false),
    (25, 18, 'Olá, caçador(a)! Estou aqui para ajudar com suas missões. Quando estiver pronto(a) para retornar da expedição, basta me procurar. Boa caçada!', true, false),
    (26, 19, 'Olá, caçador(a)! Estou aqui para ajudar com suas missões. Quando estiver pronto(a) para retornar da expedição, basta me procurar. Boa caçada!', true, false),
    (27, 20, 'Olá, caçador(a)! Estou aqui para ajudar com suas missões. Quando estiver pronto(a) para retornar da expedição, basta me procurar. Boa caçada!', true, false),
    (28, 21, 'Olá, caçador(a)! Estou aqui para ajudar com suas missões. Quando estiver pronto(a) para retornar da expedição, basta me procurar. Boa caçada!', true, false),
    (29, 22, 'Olá, caçador(a)! Estou aqui para ajudar com suas missões. Quando estiver pronto(a) para retornar da expedição, basta me procurar. Boa caçada!', true, false),
    (30, 23, 'Olá, caçador(a)! Estou aqui para ajudar com suas missões. Quando estiver pronto(a) para retornar da expedição, basta me procurar. Boa caçada!', true, false),
    (31, 24, 'Olá, caçador(a)! Estou aqui para ajudar com suas missões. Quando estiver pronto(a) para retornar da expedição, basta me procurar. Boa caçada!', true, false),
    (32, 25, 'Olá, caçador(a)! Estou aqui para ajudar com suas missões. Quando estiver pronto(a) para retornar da expedição, basta me procurar. Boa caçada!', true, false),
    (33, 26, 'Olá, caçador(a)! Estou aqui para ajudar com suas missões. Quando estiver pronto(a) para retornar da expedição, basta me procurar. Boa caçada!', true, false),
    (34, 27, 'Olá, caçador(a)! Estou aqui para ajudar com suas missões. Quando estiver pronto(a) para retornar da expedição, basta me procurar. Boa caçada!', true, false),
    (35, 28, 'Olá, caçador(a)! Estou aqui para ajudar com suas missões. Quando estiver pronto(a) para retornar da expedição, basta me procurar. Boa caçada!', true, false),
    (36, 29, 'Olá, caçador(a)! Estou aqui para ajudar com suas missões. Quando estiver pronto(a) para retornar da expedição, basta me procurar. Boa caçada!', true, false),
    (37, 30, 'Olá, caçador(a)! Estou aqui para ajudar com suas missões. Quando estiver pronto(a) para retornar da expedição, basta me procurar. Boa caçada!', true, false),
    (38, 31, 'Olá, caçador(a)! Estou aqui para ajudar com suas missões. Quando estiver pronto(a) para retornar da expedição, basta me procurar. Boa caçada!', true, false),
    (39, 32, 'Olá, caçador(a)! Estou aqui para ajudar com suas missões. Quando estiver pronto(a) para retornar da expedição, basta me procurar. Boa caçada!', true, false);

-- MONSTROSINSERT INTO Monstro (IdMonstro, Nome, Elemento, Vida, Ataque)
VALUES 
    (1, 'Acidic Glavenus', 'Acid', 5000, 800),
    (2, 'Alatreon', 'Dragon', 6000, 900),
    (3, 'Ancient Leshen', 'Dragon', 5500, 850),
    (4, 'Anjanath', 'Fire', 4500, 750),
    (5, 'Azure Rathalos', 'Fire', 4800, 780),
    (6, 'Banbaro', 'Ice', 4200, 720),
    (7, 'Barioth', 'Ice', 4300, 730),
    (8, 'Barroth', 'Water', 4000, 700),
    (9, 'Bazelgeuse', 'Fire', 5200, 820),
    (10, 'Behemoth', 'Dragon', 7000, 1000),
    (11, 'Beotodus', 'Ice', 4100, 710),
    (12, 'Black Diablos', 'Dragon', 4700, 770),
    (13, 'Blackveil Vaal Hazak', 'Dragon', 6000, 900),
    (14, 'Brachydios', 'Blast', 4800, 780),
    (15, 'Brute Tigrex', 'Dragon', 5000, 800),
    (16, 'Coral Pukei-Pukei', 'Water', 4200, 720),
    (17, 'Deviljho', 'Dragon', 5500, 850),
    (18, 'Diablos', 'Dragon', 4700, 770),
    (19, 'Dodogama', 'Water', 4000, 700),
    (20, 'Ebony Odogaron', 'Dragon', 4900, 790),
    (21, 'Fatalis', 'Dragon', 10000, 1200),
    (22, 'Frostfang Barioth', 'Ice', 4800, 780),
    (23, 'Fulgur Anjanath', 'Thunder', 4600, 760),
    (24, 'Furious Rajang', 'Thunder', 5800, 880),
    (25, 'Glavenus', 'Fire', 5000, 800),
    (26, 'Gold Rathian', 'Fire', 5200, 820),
    (27, 'Great Girros', 'Thunder', 4300, 730),
    (28, 'Great Jagras', 'Water', 3000, 500),
    (29, 'Jyuratodus', 'Water', 4100, 710),
    (30, 'Kirin', 'Thunder', 5400, 860),
    (31, 'Kulu-Ya-Ku', 'None', 3500, 650),
    (32, 'Kulve Taroth', 'None', 8000, 1000),
    (33, 'Kushala Daora', 'Ice', 5200, 820),
    (34, 'Lavasioth', 'Fire', 4700, 770),
    (35, 'Legiana', 'Ice', 4900, 790),
    (36, 'Leshen', 'Dragon', 6000, 900),
    (37, 'Lunastra', 'Fire', 5500, 850),
    (38, 'Namielle', 'Water', 5600, 860),
    (39, 'Nargacuga', 'None', 4500, 750),
    (40, 'Nergigante', 'Dragon', 7000, 1000),
    (41, 'Nightshade Paolumu', 'Thunder', 4400, 740),
    (42, 'Odogaron', 'Dragon', 4900, 790),
    (43, 'Paolumu', 'None', 4200, 720),
    (44, 'Pink Rathian', 'Fire', 5100, 810),
    (45, 'Pukei-Pukei', 'Poison', 3900, 690),
    (46, 'Radobaan', 'None', 4300, 730),
    (47, 'Raging Brachydios', 'Blast', 5600, 860),
    (48, 'Rajang', 'Thunder', 5700, 870),
    (49, 'Rathalos', 'Fire', 5300, 830),
    (50, 'Rathian', 'Fire', 5200, 820),
    (51, 'Ruiner Nergigante', 'Dragon', 8000, 1100),
    (52, 'Safijiiva', 'Dragon', 8000, 1000),
    (53, 'Savage Deviljho', 'Dragon', 5800, 880),
    (54, 'Scarred Yian Garuga', 'Fire', 5400, 860),
    (55, 'Seething Bazelgeuse', 'Fire', 5800, 880),
    (56, 'Shara Ishvalda', 'Dragon', 9000, 1100),
    (57, 'Shrieking Legiana', 'Ice', 4900, 790),
    (58, 'Silver Rathalos', 'Fire', 5400, 860),
    (59, 'Stygian Zinogre', 'Dragon', 5600, 860),
    (60, 'Teostra', 'Fire', 5500, 850),
    (61, 'Tigrex', 'Dragon', 5000, 800),
    (62, 'Tobi-Kadachi', 'Thunder', 4600, 760),
    (63, 'Tzitzi-Ya-Ku', 'Thunder', 4300, 730),
    (64, 'Uragaan', 'Fire', 5100, 810),
    (65, 'Vaal Hazak', 'Dragon', 6000, 900),
    (66, 'Velkhana', 'Ice', 5800, 880),
    (67, 'Viper Tobi-Kadachi', 'Thunder', 4500, 750),
    (68, 'Xenojiiva', 'Dragon', 8000, 1000),
    (69, 'Yian Garuga', 'Fire', 5400, 860),
    (70, 'Zinogre', 'Thunder', 4700, 770),
    (71, 'Zorah Magdaros', 'Dragon', 12000, 1500), 
    (72, 'Jagras', 'Water', 2800, 480), 
    (73, 'Kestodon Femea', 'None', 2500, 450), 
    (74, 'Kestodon Macho', 'None', 2500, 450);




-- REGIAO MONSTRO
INSERT INTO RegiaoMonstro (IdRegiaoMonstro, Regiao, Monstro)
VALUES
-- Vale Norte (10)
(1, 10, 1),  -- Acidic Glavenus
(2, 10, 6),  -- Banbaro
(3, 10, 14), -- Brachydios
(4, 10, 25), -- Glavenus
(5, 10, 61), -- Tigrex

-- Vale Sul (11)
(6, 11, 7),  -- Barioth
(7, 11, 18), -- Diablos
(8, 11, 29), -- Jyuratodus
(9, 11, 34), -- Lavasioth
(10, 11, 64), -- Uragaan

-- Vale Central (12)
(11, 12, 31),  -- Kulu-ya-ku
(12, 12, 46), -- Radobaan
(13, 12, 47), -- Raging Brachydios
(14, 12, 71), -- Zorah Magdaros

-- Área de Anjanath (13)
(15, 13, 4),  -- Anjanath

-- Área de Rathalos (14)
(16, 14, 5),  -- Azure Rathalos
(17, 14, 49), -- Rathalos
(18, 14, 58), -- Silver Rathalos

-- Área de Rathian (15)
(19, 15, 26), -- Gold Rathian
(20, 15, 44), -- Pink Rathian
(21, 15, 50), -- Rathian

-- Área de Tobi-Kadachi (16)
(22, 16, 23), -- Fulgur Anjanath
(23, 16, 62), -- Tobi-Kadachi
(24, 16, 67), -- Viper Tobi-Kadachi

-- Área de Great Jagras (17)
(25, 17, 19), -- Dodogama
(26, 17, 28), -- Great Jagras
(27, 17, 27), -- Great Girros

-- Planícies de Areia (21)
(28, 21, 12), -- Black Diablos
(29, 21, 8), -- Barroth

-- Área de Diablos (22)
(30, 22, 18), -- Diablos
(31, 22, 12), -- Black Diablos

-- Área de Rathian (23)
(32, 23, 16), -- Coral Pukei-Pukei
(33, 23, 43), -- Paolumu
(34, 23, 44), -- Pink Rathian
(35, 23, 45), -- Pukei-Pukei

-- Oásis (24)
(36, 24, 8),  -- Barroth
(37, 24, 29), -- Jyuratodus
(38, 24, 34), -- Lavasioth

-- Pântano de Ácido (25)
(39, 25, 1), -- Acidic Glavenus
(40, 25, 17), -- Deviljho
(41, 25, 29), -- Jyuratodus
(42, 25, 46), -- Radobaan

-- Área de Legiana (29)
(43, 29, 35), -- Legiana
(44, 29, 57), -- Shrieking Legiana

-- Área de Paolumu (30)
(45, 30, 41), -- Nightshade Paolumu
(46, 30, 43), -- Paolumu

-- Área de Tzitzi-Ya-Ku (31)
(47, 31, 9), -- Bazelgeuse
(48, 31, 63), -- Tzitzi-Ya-Ku

-- Ninhos Superiores (32)
(49, 32, 33), -- Kushala Daora
(50, 32, 38), -- Namielle
(51, 32, 68), -- Xenojiiva

-- Área de Great Girros (36)
(52, 36, 27), -- Great Girros
(53, 36, 55), -- Seething Bazelgeuse

-- Área de Odogaron (37)
(54, 37, 20), -- Ebony Odogaron
(55, 37, 42), -- Odogaron

-- Área de Radobaan (38)
(56, 38, 46), -- Radobaan

-- Covil da Morte (39)
(57, 39, 65), -- Vaal Hazak
(58, 39, 13), -- Blackveil Vaal Hazak

-- Área de Nergigante (44)
(59, 44, 40), -- Nergigante
(60, 44, 51), -- Ruiner Nergigante

-- Área de Teostra (45)
(61, 45, 37), -- Lunastra
(62, 45, 60), -- Teostra

-- Área de Vaal Hazak (46)
(63, 46, 65), -- Vaal Hazak
(64, 46, 13), -- Blackveil Vaal Hazak

-- Área de Kushala Daora (47)
(65, 47, 33), -- Kushala Daora

-- Planalto do Ancião (52)
(67, 52, 3), -- Ancient Leshen
(68, 52, 36), -- Leshen
(69, 52, 56), -- Shara Ishvalda

-- Área de Beotodus (53)
(70, 53, 11), -- Beotodus

-- Área de Banbaro (54)
(71, 54, 6),  -- Banbaro

-- Picos Gelados (55)
(72, 55, 7),  -- Barioth
(73, 55, 22), -- Frostfang Barioth
(74, 55, 33), -- Kushala Daora
(75, 55, 35), -- Legiana
(76, 55, 57), -- Shrieking Legiana
(77, 55, 66); -- Velkhana


-- ITENS
INSERT INTO Item (IdItem, Nome, Raridade, Tipo, Funcao, Descricao, ValorVenda, CustoCompra) VALUES
    (1, 'Poção de Vida', 1, 1, 'Cura', 'Cura uma pequena quantidade de vida.', 10, 5),
    (2, 'Mega Poção', 2, 1, 'Cura', 'Cura uma quantidade considerável de vida.', 20, 10),
    (3, 'Poção Máxima', 3, 1, 'Cura', 'Cura a vida ao máximo.', 50, 25),
    (4, 'Poção Ancestral', 4, 1, 'Cura', 'Cura completamente a vida e maximiza a stamina.', 100, 50),
    (5, 'Antídoto', 1, 1, 'Cura', 'Cura veneno.', 8, 4),
    (6, 'Medicina Herbal', 1, 1, 'Cura', 'Cura veneno e restaura uma pequena quantidade de vida.', 12, 6),
    (7, 'Pó de Vida', 3, 1, 'Cura', 'Cura todos os aliados próximos.', 5, 15),
    (8, 'Pó Herbal', 4, 1, 'Cura', 'Cura todos os aliados próximos e remove vários efeitos de status.', 5, 20),
    (9, 'Bebida Energética', 2, 1, 'Cura', 'Restaura a stamina e remove o sono.', 15, 8),
    (10, 'Semente de Poder', 1, 2, 'Aprimoramento', 'Aumenta temporariamente o ataque.', 10, 5),
    (11, 'Demôniozina', 2, 2, 'Aprimoramento', 'Aumenta o ataque.', 15, 8),
    (12, 'Mega Demôniozina', 3, 2, 'Aprimoramento', 'Aumenta consideravelmente o ataque.', 25, 12),
    (13, 'Pílula de Poder', 4, 2, 'Aprimoramento', 'Aumenta muito o ataque por um curto período.', 50, 20),
    (14, 'Semente de Adaman', 1, 2, 'Aprimoramento', 'Aumenta temporariamente a defesa.', 10, 5),
    (15, 'Pele de Armadura', 2, 2, 'Aprimoramento', 'Aumenta a defesa.', 15, 8),
    (16, 'Mega Pele de Armadura', 3, 2, 'Aprimoramento', 'Aumenta consideravelmente a defesa.', 25, 12),
    (17, 'Pílula de Adaman', 4, 2, 'Aprimoramento', 'Aumenta muito a defesa por um curto período.', 50, 20),
    (18, 'Pó de Demônio', 2, 2, 'Aprimoramento', 'Aumenta o ataque de todos os aliados próximos.', 5, 30),
    (19, 'Pó de Carapaça', 3, 2, 'Aprimoramento', 'Aumenta a defesa de todos os aliados próximos.', 5, 30),
    (20, 'Imunizador', 3, 2, 'Aprimoramento', 'Restaura gradualmente a saúde ao longo do tempo.', 5, 40),
    (21, 'Suco de Corrida', 2, 2, 'Aprimoramento', 'Reduz o esgotamento de stamina.', 5, 25),
    (22, 'Bebida Gelada', 1, 2, 'Aprimoramento', 'Refresca o corpo em ambientes quentes.', 15, 8),
    (23, 'Bebida Quente', 1, 2, 'Aprimoramento', 'Aquece o corpo em ambientes frios.', 15, 8),
    (24, 'Amuleto de Poder', 4, 2, 'Aprimoramento', 'Aumenta permanentemente o ataque (Carregue na bolsa de itens).', 5, 300),
    (25, 'Garra de Poder', 4, 2, 'Aprimoramento', 'Aumenta permanentemente o ataque (Guarde na caixa de itens).', 5, 500),
    (26, 'Amuleto de Armadura', 4, 2, 'Aprimoramento', 'Aumenta permanentemente a defesa (Carregue na bolsa de itens).', 5, 300),
    (27, 'Garra de Armadura', 4, 2, 'Aprimoramento', 'Aumenta permanentemente a defesa (Guarde na caixa de itens).', 5, 500),
    (28, 'Extrato de Corrida', 1, 3, 'Material', 'Material obtido de certos monstros.', 5, 20),
    (29, 'Catalisador', 2, 3, 'Material', 'Material usado para criar vários itens.', 5, 30),
    (30, 'Mel', 1, 3, 'Material', 'Substância doce usada na criação.', 5, 10),
    (31, 'Carne Crua', 1, 4, 'Carne', 'Carne crua de um monstro.', 8, 4),
    (32, 'Bife Raro', 2, 4, 'Carne', 'Cozido à perfeição.', 15, 8),
    (33, 'Bife Bem Passado', 3, 4, 'Carne', 'Carne excepcionalmente bem cozida.', 20, 10),
    (34, 'Ração', 1, 4, 'Carne', 'Comida portátil e fácil de comer.', 5, 3),
    (35, 'Carne Queimada', 1, 4, 'Carne', 'Muito cozida e não comestível.', 2, 1),
    (36, 'Jerky de Astera', 2, 4, 'Carne', 'Jerky feito em Astera.', 10, 5),
    (37, 'Churrasqueira', 1, 5, 'Item Fixo', 'Usada para cozinhar carne.', 5, 5),
    (38, 'Pedra de Amolar', 2, 5, 'Item Fixo', 'Afia armas cortantes.', 5, 5),
    (39, 'Rede de Captura', 1, 5, 'Item Fixo', 'Usada para capturar pequenos insetos.', 5, 5),
    (40, 'Vara de Pesca', 2, 5, 'Item Fixo', 'Usada para pescar.', 5, 5),
    (41, 'Binóculos', 1, 6, 'Ferramenta', 'Usado para observar monstros à distância.', 5, 5),
    (42, 'Bumerangue', 2, 6, 'Ferramenta', 'Lança um bumerangue que pode derrubar itens de monstros.', 5, 5),
    (43, 'Bomba de Fumaça', 1, 6, 'Ferramenta', 'Cria uma cortina de fumaça para escapar de monstros.', 5, 5),
    (44, 'Pod de Flash', 1, 6, 'Ferramenta', 'Um pod que libera uma luz cegante quando atingido.', 5, 5),
    (45, 'Pod de Grito', 1, 6, 'Ferramenta', 'Um pod que emite um grito alto quando atingido.', 5, 5),
    (46, 'Pod de Estouro', 1, 6, 'Ferramenta', 'Um pod que emite um som alto quando atingido.', 5, 5),
    (47, 'Dung Pod', 1, 6, 'Ferramenta', 'Um pod com fezes que pode ser atirado para afastar monstros.', 5, 5),
    (48, 'Fezes', 1, 6, 'Ferramenta', 'Fezes de monstro enroladas para serem usadas como isca.', 5, 5),
    (49, 'Farcaster', 1, 6, 'Ferramenta', 'Um item que transporta imediatamente o usuário de volta para a base.', 5, 5),
    (50, 'Runa do Caçador', 1, 6, 'Ferramenta', 'Uma runa que cria uma barreira que impede a entrada de monstros.', 5, 5),
    (51, 'Esfera de Banimento', 1, 6, 'Ferramenta', 'Uma esfera que banirá monstros para longe.', 5, 5),
    (52, 'Ferramenta de Captura', 1, 7, 'Armadilha', 'Usada para criar armadilhas.', 5, 5),
    (53, 'Armadilha Elétrica', 1, 7, 'Armadilha', 'Uma armadilha que paralisa monstros temporariamente.', 5, 5),
    (54, 'Armadilha de Buraco', 1, 7, 'Armadilha', 'Uma armadilha que prende monstros temporariamente.', 5, 5),
    (55, 'Bomba Tranquilizante', 1, 7, 'Armadilha', 'Uma bomba que acalma monstros enfraquecidos.', 5, 5),
    (56, 'Facão de Tranquilização', 1, 7, 'Armadilha', 'Usado para libertar companheiros capturados.', 5, 5),
    (57, 'Bala de Atordoamento', 1, 7, 'Bomba', 'Uma bala de canhão que atordoa monstros temporariamente.', 5, 5),
    (58, 'Bomba de Barril', 1, 7, 'Bomba', 'Uma bomba básica que explode quando atingida.', 5, 5),
    (59, 'Bomba de Barril Grande', 2, 7, 'Bomba', 'Uma bomba grande com uma explosão maior.', 5, 5),
    (60, 'Bomba de Barril+ ', 3, 7, 'Bomba', 'Uma bomba aprimorada que causa uma explosão maior.', 5, 5),
    (61, 'Bomba de Barril Mega', 4, 7, 'Bomba', 'Uma bomba enorme com uma explosão enorme.', 5, 5),
    (62, 'Fogos de Artifício', 1, 7, 'Bomba', 'Usados para criar uma exibição de fogos de artifício.', 5, 5),
    (63, 'Erva Nulberry', 1, 8, 'Planta', 'Cura vários efeitos de status.', 10, 5),
    (64, 'Semente de Poder', 1, 8, 'Planta', 'Aumenta temporariamente o ataque.', 10, 5),
    (65, 'Semente de Adaman', 1, 8, 'Planta', 'Aumenta temporariamente a defesa.', 10, 5),
    (66, 'Erva', 1, 8, 'Planta', 'Usada para criar várias poções e itens.', 8, 4),
    (67, 'Erva Antídoto', 1, 8, 'Planta', 'Usada para criar antidotos.', 8, 4),
    (68, 'Erva de Fogo', 1, 8, 'Planta', 'Usada para criar itens relacionados a fogo.', 8, 4),
    (69, 'Erva de Neve', 1, 8, 'Planta', 'Usada para criar itens relacionados a ambientes frios.', 8, 4),
    (70, 'Erva do Sono', 1, 8, 'Planta', 'Usada para criar itens relacionados a sono.', 8, 4),
    (71, 'Ivy', 1, 8, 'Planta', 'Usada para criar itens de captura e armadilhas.', 8, 4),
    (72, 'Bagos Azuis', 1, 8, 'Planta', 'Usada para criar poções e itens relacionados a veneno.', 8, 4),
    (73, 'Cogumelo Azul', 1, 8, 'Planta', 'Usado para criar poções e itens relacionados a água.', 8, 4),
    (74, 'Erva da Neve', 1, 8, 'Planta', 'Usada para criar itens relacionados a ambientes frios.', 8, 4),
    (75, 'Mandrágora', 1, 8, 'Planta', 'Usada para criar itens de cura avançados.', 8, 4),
    (76, 'Cogumelo Explosivo', 1, 8, 'Planta', 'Usado para criar itens explosivos.', 8, 4),
    (77, 'Cogumelo Venenoso', 1, 8, 'Planta', 'Usado para criar itens relacionados a veneno.', 8, 4),
    (78, 'Cogumelo de Gelo', 1, 8, 'Planta', 'Usado para criar itens relacionados a gelo.', 8, 4),
    (79, 'Erva Noturna', 1, 8, 'Planta', 'Usada para criar itens de sono.', 8, 4),
    (80, 'Erva de Gelo', 1, 8, 'Planta', 'Usada para criar itens relacionados a gelo.', 8, 4),
    (81, 'Cogumelo Trovejante', 1, 8, 'Planta', 'Usado para criar itens relacionados a trovão.', 8, 4),
    (82, 'Cogumelo Trovão', 1, 8, 'Planta', 'Usado para criar itens relacionados a trovão.', 8, 4),
    (83, 'Cogumelo Aromático', 1, 8, 'Planta', 'Usado para criar itens de aprimoramento.', 8, 4),
    (84, 'Cogumelo Relaxante', 1, 8, 'Planta', 'Usado para criar itens que aumentam a resistência a efeitos de status.', 8, 4),
    (85, 'Bagos Explosivos', 1, 8, 'Planta', 'Usado para criar itens explosivos.', 8, 4),
    (86, 'Bagos de Impacto', 1, 8, 'Planta', 'Usado para criar itens de impacto.', 8, 4),
    (87, 'Pólvora', 1, 8, 'Planta', 'Usada para criar munição.', 8, 4),
    (88, 'Vagem-Dragão', 1, 8, 'Planta', 'Usada para criar itens relacionados a dragões.', 8, 4),
    (89, 'Semente de Energia', 1, 8, 'Planta', 'Usada para criar itens de aprimoramento de stamina.', 8, 4),
    (90, 'Semente de Erupção', 1, 8, 'Planta', 'Usada para criar itens relacionados a fogo.', 8, 4),
    (91, 'Baga do Diabo', 1, 8, 'Planta', 'Usada para criar itens relacionados a fogo.', 8, 4),
    (92, 'Cogumelo Bombástico', 1, 8, 'Planta', 'Usado para criar itens explosivos.', 8, 4),
    (93, 'Fava de Terra', 1, 8, 'Planta', 'Usada para criar itens relacionados a paralisia.', 8, 4),
    (94, 'Fava de Água', 1, 8, 'Planta', 'Usada para criar itens relacionados a água.', 8, 4),
    (95, 'Pó de Inseto', 1, 8, 'Inseto', 'Usado para criar itens relacionados a insetos.', 8, 4),
    (96, 'Inseto Brilhante', 1, 8, 'Inseto', 'Usado para criar itens relacionados a insetos.', 8, 4),
    (97, 'Inseto de Ouro', 1, 8, 'Inseto', 'Usado para criar itens relacionados a insetos.', 8, 4),
    (98, 'Inseto Trovejante', 1, 8, 'Inseto', 'Usado para criar itens relacionados a trovão.', 8, 4),
    (99, 'Isca de Inseto', 1, 8, 'Inseto', 'Usado para atrair insetos.', 8, 4),
    (100, 'Isca de Arowana', 1, 8, 'Peixe', 'Usada para atrair arowanas.', 8, 4),
    (101, 'Isca de Peixe em Pólvora', 1, 8, 'Peixe', 'Usada para atrair peixes explosivos.', 8, 4),
    (102, 'Isca de Peixe Dourado', 1, 8, 'Peixe', 'Usada para atrair peixes dourados.', 8, 4),
    (103, 'Barbatana de Whetfish', 1, 8, 'Peixe', 'Usada para criar facas de afiação.', 8, 4),
    (104, 'Escala de Burst Arowana', 1, 8, 'Peixe', 'Usada para criar itens explosivos.', 8, 4),
    (105, 'Escala de Sushifish', 1, 8, 'Peixe', 'Usada para criar itens de cura.', 8, 4),
    (106, 'Escama de Gunpowderfish', 1, 8, 'Peixe', 'Usada para criar munição explosiva.', 8, 4),
    (107, 'Escama de Gunpowderfish Dourado', 2, 8, 'Peixe', 'Usada para criar munição explosiva dourada.', 8, 4),
    (108, 'Escama de Gunpowderfish Poderoso', 3, 8, 'Peixe', 'Usada para criar munição explosiva poderosa.', 8, 4), 
    (109, 'Barbatana de Sushifish', 1, 8, 'Peixe', 'Usada para criar itens de cura.', 8, 4),
    (110, 'Barbatana de Gunpowderfish', 1, 8, 'Peixe', 'Usada para criar munição explosiva.', 8, 4),
    (111, 'Barbatana de Gunpowderfish Dourado', 2, 8, 'Peixe', 'Usada para criar munição explosiva dourada.', 8, 4),
    (112, 'Barbatana de Gunpowderfish Poderoso', 3, 8, 'Peixe', 'Usada para criar munição explosiva poderosa.', 8, 4),
    (113, 'Pétala de Whetfish', 1, 8, 'Peixe', 'Usada para criar facas de afiação.', 8, 4),
    (114, 'Folha de Burst Arowana', 1, 8, 'Peixe', 'Usada para criar itens explosivos.', 8, 4),
    (115, 'Folha de Sushifish', 1, 8, 'Peixe', 'Usada para criar itens de cura.', 8, 4),
    (116, 'Folha de Gunpowderfish', 1, 8, 'Peixe', 'Usada para criar munição explosiva.', 8, 4),
    (117, 'Folha de Gunpowderfish Dourado', 2, 8, 'Peixe', 'Usada para criar munição explosiva dourada.', 8, 4),
    (118, 'Folha de Gunpowderfish Poderoso', 3, 8, 'Peixe', 'Usada para criar munição explosiva poderosa.', 8, 4),
    (119, 'Carne Crua', 1, 9, 'Carne', 'Carne crua obtida de monstros.', 10, 5),
    (120, 'Bife Bem Passado', 1, 9, 'Carne', 'Bife bem passado obtido de monstros.', 10, 5),
    (121, 'Bife ao Ponto', 1, 9, 'Carne', 'Bife ao ponto obtido de monstros.', 10, 5),
    (122, 'Ração', 1, 9, 'Carne', 'Ração para aumentar a stamina.', 10, 5),
    (123, 'Carne Queimada', 1, 9, 'Carne', 'Carne queimada obtida de monstros.', 10, 5),
    (124, 'Jerky Astera', 1, 9, 'Carne', 'Jerky Astera obtido de monstros.', 10, 5),
    (125, 'Farcaster', 1, 10, 'Item Fixo', 'Item que transporta imediatamente o usuário de volta para a base.', 5, 5),
    (126, 'Arma de Captura', 1, 10, 'Item Fixo', 'Usada para criar armadilhas.', 5, 5),
    (127, 'Armadilha Elétrica', 1, 10, 'Item Fixo', 'Uma armadilha que paralisa monstros temporariamente.', 5, 5),
    (128, 'Armadilha de Buraco', 1, 10, 'Item Fixo', 'Uma armadilha que prende monstros temporariamente.', 5, 5),
    (129, 'Bomba Tranquilizante', 1, 10, 'Item Fixo', 'Uma bomba que acalma monstros enfraquecidos.', 5, 5),
    (130, 'Facão de Tranquilização', 1, 10, 'Item Fixo', 'Usado para libertar companheiros capturados.', 5, 5),
    (131, 'Bala de Atordoamento', 1, 10, 'Item Fixo', 'Uma bala de canhão que atordoa monstros temporariamente.', 5, 5),
    (132, 'Bomba de Barril', 1, 10, 'Item Fixo', 'Uma bomba básica que explode quando atingida.', 5, 5),
    (133, 'Bomba de Barril Grande', 2, 10, 'Item Fixo', 'Uma bomba grande com uma explosão maior.', 5, 5),
    (134, 'Bomba de Barril+', 3, 10, 'Item Fixo', 'Uma bomba aprimorada que causa uma explosão maior.', 5, 5),
    (135, 'Bomba de Barril Mega', 4, 10, 'Item Fixo', 'Uma bomba enorme com uma explosão enorme.', 5, 5),
    (136, 'Fogos de Artifício', 1, 10, 'Item Fixo', 'Usados para criar uma exibição de fogos de artifício.', 5, 5),
    (137, 'Osso Ancestral', 4, 11, 'Material', 'Osso antigo encontrado em depósitos de ossos na Floresta Antiga.', 40, 60),
    (138, 'Dente de Anjanath', 4, 11, 'Material', 'Dente afiado de Anjanath.', 40, 60),
    (139, 'Dente de Anjanath +', 6, 11, 'Material', 'Dente afiado melhorado de Anjanath.', 60, 90),
    (140, 'Gema de Anjanath', 5, 11, 'Material', 'Gema rara de Anjanath.', 50, 75),
    (141, 'Moeda de Caçador Experiente', 8, 11, 'Material', 'Moeda recebida por realizações notáveis em Arena Quests 08/09.', 80, 120),
    (142, 'Esfera de Armadura Avançada', 6, 11, 'Material', 'Esfera usada para aprimorar armaduras de alto nível.', 60, 90),
    (143, 'Osso Nasal de Anjanath', 4, 11, 'Material', 'Osso nasofrontal de Anjanath.', 40, 60),
    (144, 'Osso Nasal de Anjanath +', 6, 11, 'Material', 'Osso nasofrontal melhorado de Anjanath.', 60, 90),
    (145, 'Pele de Anjanath', 4, 11, 'Material', 'Pele de Anjanath usada para várias criações.', 40, 60),
    (146, 'Pele de Anjanath +', 6, 11, 'Material', 'Pele de Anjanath melhorada usada para várias criações.', 60, 90),
    (147, 'Placa de Anjanath', 5, 11, 'Material', 'Placa de Anjanath usada em várias criações.', 50, 75),
    (148, 'Semente Adamantina', 2, 8, 'Planta', 'Semente rara usada para aprimoramento.', 20, 30),
    (149, 'Escama de Anjanath', 4, 11, 'Material', 'Escama de Anjanath usada em várias criações.', 40, 60),
    (150, 'Escama de Anjanath +', 6, 11, 'Material', 'Escama de Anjanath melhorada usada em várias criações.', 60, 90),
    (151, 'Cauda de Anjanath', 4, 11, 'Material', 'Cauda de Anjanath usada em várias criações.', 40, 60),
    (152, 'Antídoto', 1, 1, 'Cura', 'Curativo para efeitos de veneno.', 10, 15),
    (153, 'Erva Antídoto', 1, 8, 'Planta', 'Erva usada para criar antídotos.', 10, 15),
    (154, 'Saco Aqua', 4, 11, 'Material', 'Saco coletado de Jyuratodus. Possui propriedades aquáticas.', 40, 60),
    (155, 'Minério de Aqua Núcleo', 4, 11, 'Material', 'Minério coletado de afloramentos azuis nas Terras Altas Coralinas.', 40, 60),
    (156, 'Esfera de Armadura', 4, 11, 'Material', 'Esfera usada para aprimorar armaduras.', 40, 60),
    (157, 'Esfera de Armadura +', 5, 11, 'Material', 'Esfera aprimorada usada para aprimorar armaduras.', 50, 75),
    (158, 'Jerky Astera', 2, 9, 'Carne', 'Jerky de qualidade de Astera.', 20, 30),
    (159, 'Jóia de Ataque', 7, 11, 'Material', 'Jóia valiosa que aumenta a habilidade de ataque.', 70, 105),
    (160, 'Ingresso Colheita de Outono', 1, 11, 'Material', 'Ingresso para o Festival Colheita de Outono.', 10, 15),
    (161, 'Carapaça de Azure Rathalos', 6, 11, 'Material', 'Carapaça de Azure Rathalos usada em várias criações.', 60, 90),
    (162, 'Escama de Azure Rathalos +', 6, 11, 'Material', 'Escama aprimorada de Azure Rathalos usada em várias criações.', 60, 90),
    (163, 'Cauda de Azure Rathalos', 6, 11, 'Material', 'Cauda de Azure Rathalos usada em várias criações.', 60, 90),
    (164, 'Asa de Azure Rathalos', 6, 11, 'Material', 'Asa de Azure Rathalos usada em várias criações.', 60, 90),
    (165, 'Fragmento Estelar Azure', 1, 11, 'Material', 'Fragmento da USJ: Gold Star Treatment. Valor inestimável.', 10, 15),
    (166, 'Baitbug', 3, 8, 'Inseto', 'Inseto usado como isca para atrair criaturas.', 30, 45),
    (167, 'Garra de Barnos', 6, 11, 'Material', 'Garra afiada de Barnos.', 60, 90),
    (168, 'Pele de Barnos +', 6, 11, 'Material', 'Pele de Barnos aprimorada usada em várias criações.', 60, 90),
    (169, 'Carapaça de Barroth', 6, 11, 'Material', 'Carapaça de Barroth usada em várias criações.', 60, 90),
    (170, 'Moeda Barroth', 1, 11, 'Material', 'Moeda recebida por derrotar Barroth na Arena.', 10, 15),
    (171, 'Garra de Barroth', 4, 11, 'Material', 'Garra de Barroth usada em várias criações.', 40, 60),
    (172, 'Garra de Barroth +', 6, 11, 'Material', 'Garra aprimorada de Barroth usada em várias criações.', 60, 90),
    (173, 'Dorsal de Barroth', 4, 11, 'Material', 'Dorsal de Barroth usada em várias criações.', 40, 60),
    (174, 'Dorsal de Barroth +', 6, 11, 'Material', 'Dorsal aprimorada de Barroth usada em várias criações.', 60, 90),
    (175, 'Escalpo de Barroth', 4, 11, 'Material', 'Escalpo de Barroth usada em várias criações.', 40, 60),
    (176, 'Concha de Barroth', 4, 11, 'Material', 'Concha de Barroth usada em várias criações.', 40, 60),
    (177, 'Cauda de Barroth', 4, 11, 'Material', 'Cauda de Barroth usada em várias criações.', 40, 60),
    (178, 'Carapaça de Bazelgeuse', 6, 11, 'Material', 'Carapaça de Bazelgeuse usada em várias criações.', 60, 90),
    (179, 'Fusível de Bazelgeuse', 1, 11, 'Material', 'Fusível de Bazelgeuse. Valor inestimável.', 10, 15),
    (180, 'Gema de Bazelgeuse', 1, 11, 'Material', 'Gema rara de Bazelgeuse. Valor inestimável.', 10, 15),
    (181, 'Escama de Bazelgeuse +', 6, 11, 'Material', 'Escama aprimorada de Bazelgeuse usada em várias criações.', 60, 90),
    (182, 'Cauda de Bazelgeuse', 1, 11, 'Material', 'Cauda de Bazelgeuse usada em várias criações.', 10, 15),
    (183, 'Garra de Bazelgeuse', 1, 11, 'Material', 'Garra de Bazelgeuse usada em várias criações.', 10, 15),
    (184, 'Asa de Bazelgeuse', 1, 11, 'Material', 'Asa de Bazelgeuse usada em várias criações.', 10, 15),
    (185, 'Símbolo Banuk Guerreiro', 10, 11, 'Material', 'Símbolo usado por guerreiros Banuk. Valor inestimável.', 150, 225),
    (186, 'Osso de Behemoth', 7, 11, 'Material', 'Osso coletado de Behemoth.', 70, 105),
    (187, 'Grande Chifre de Behemoth', 8, 11, 'Material', 'Grande chifre coletado de Behemoth.', 80, 120),
    (188, 'Crina de Behemoth', 7, 11, 'Material', 'Crina coletada de Behemoth.', 70, 105),
    (189, 'Garra de Behemoth', 8, 11, 'Material', 'Garra coletada de Behemoth.', 80, 120),
    (190, 'Cauda de Behemoth', 8, 11, 'Material', 'Cauda coletada de Behemoth.', 80, 120),
    (191, 'Gema de Wyvern de Pássaro', 7, 11, 'Material', 'Gema rara coletada de Wyverns de Pássaro.', 70, 105),
    (192, 'Bitterbug', 1, 8, 'Inseto', 'Inseto amargo coletado na Floresta Antiga.', 10, 15),
    (193, 'Atadura Negra', 1, 11, 'Material', 'Atadura de qualidade feita de pele de Shamos.', 10, 15),
    (194, 'Carapaça de Diablos Negro', 6, 11, 'Material', 'Carapaça de Diablos Negro usada em várias criações.', 60, 90),
    (195, 'Pico Negro +', 6, 11, 'Material', 'Pico aprimorado de Diablos Negro usado em várias criações.', 60, 90),
    (196, 'Chifre Espiral Negro +', 6, 11, 'Material', 'Chifre espiral aprimorado de Diablos Negro usado em várias criações.', 60, 90),
    (197, 'Chifre Bazelgeuse Negro +', 6, 11, 'Material', 'Chifre aprimorado de Bazelgeuse Negro usado em várias criações.', 60, 90),
    (198, 'Noz Explosiva', 1, 11, 'Material', 'Noz coletada na Floresta Antiga, Terras Altas Coralinas, Terras Ermas e Vale Descanso.', 10, 15),
    (199, 'Blazenut', 2, 8, 'Planta', 'Noz inflamável coletada nas Terras Altas Coralinas, Vale Descanso e Vale dos Anciãos.', 20, 30),
    (200, 'Médula de Diablos', 6, 11, 'Material', 'Médula extraída de Diablos.', 60, 90),
    (201, 'Bico Feliz', 1, 11, 'Material', 'Bico alegre coletado na Floresta Antiga e Terras Altas. Possui diversas utilidades.', 10, 15),
    (202, 'Cogumelo Azul', 2, 8, 'Cogumelo', 'Cogumelo azul com propriedades curativas. Encontrado em áreas específicas.', 20, 30),
    (203, 'Arowana Explosiva', 2, 11, 'Material', 'Arowana explosiva encontrada nas Terras Altas Coralinas, Vale Descanso, Terras Ermas, Vale dos Anciãos.', 20, 30),
    (204, 'Escama de Arowana Explosiva', 2, 11, 'Material', 'Escama de Arowana explosiva. Coletada nas florestas corais e no Vale Estrondoso.', 20, 30),
    (205, 'Bumerangue', 4, 10, 'Arma', 'Bumerangue usado como arma arremessável. Comprado do estoque de provisões.', 40, 60),
    (206, 'Jóia de Botânica', 5, 11, 'Material', 'Jóia especial que aumenta a habilidade de botânica.', 50, 75),
    (207, 'Osso Brutal', 6, 11, 'Material', 'Osso resistente coletado no Vale dos Anciãos e em missões.', 60, 90),
    (208, 'Moeda Bruta', 1, 11, 'Material', 'Moeda recebida por completar Arena-Quest 08.', 10, 15),
    (209, 'Carne Queimada', 1, 9, 'Carne', 'Carne queimada obtida ao cozinhar carne crua.', 10, 15),
    (210, 'Arowana Explosiva', 1, 11, 'Material', 'Arowana que explode ao ser arremessada. Encontrada em várias áreas.', 10, 15),
    (211, 'Vagem Explosiva', 1, 11, 'Material', 'Vagem que explode ao ser arremessada. Encontrada em várias áreas.', 10, 15),
    (212, 'Boulder Bone', 4, 11, 'Material', 'Osso robusto coletado de depósitos de ossos na Espinha da Terras Altas.', 40, 60),
    (213, 'Musgo Brilhante', 2, 11, 'Material', 'Musgo brilhante coletado na Floresta Antiga. Possui propriedades luminosas.', 20, 30),
    (214, 'Minério de Carbalite', 6, 11, 'Material', 'Minério azulado coletado de afloramentos de minérios de alto nível.', 60, 90),
    (215, 'Saco Comatoso', 6, 11, 'Material', 'Saco coletado de Radobaan. Possui propriedades soporíferas.', 60, 90),
    (216, 'Recomendação', 5, 11, 'Material', 'Recompensa por completar missões envolvendo Zorah Magdaros.', 50, 75),
    (217, 'Osso Coral', 4, 11, 'Material', 'Osso coletado de depósitos de ossos nas Terras Altas Coralinas.', 40, 60),
    (218, 'Cristal Coral', 4, 11, 'Material', 'Cristal extraído de afloramentos de minérios nas Terras Altas Coralinas.', 40, 60),
    (219, 'Gélido Frio Sangrento', 10, 11, 'Material', 'Dente valioso de um Icefang Fanged Wyvern. Coletado nas Terras Guiding.', 100, 150),
    (220, 'Carapaça de Daora', 7, 11, 'Material', 'Carapaça resistente de Kushala Daora usada em criações diversas.', 70, 105),
    (221, 'Garra + de Daora', 7, 11, 'Material', 'Garra aprimorada de Kushala Daora usada em criações diversas.', 70, 105),
    (222, 'Escama + de Dragão de Daora', 7, 11, 'Material', 'Escama aprimorada de Kushala Daora usada em criações diversas.', 70, 105),
    (223, 'Gema de Daora', 1, 11, 'Material', 'Gema rara de Kushala Daora. Valor inestimável.', 10, 15),
    (224, 'Chifre + de Daora', 7, 11, 'Material', 'Chifre aprimorado de Kushala Daora usado em criações diversas.', 70, 105),
    (225, 'Cauda de Daora', 7, 11, 'Material', 'Cauda de Kushala Daora usada em criações diversas.', 70, 105),
    (226, 'Tecido de Daora', 7, 11, 'Material', 'Tecido de Kushala Daora. Obtido nas asas do monstro.', 70, 105),
    (227, 'Escama Gélida de Daora', 7, 11, 'Material', 'Escama gélida de Kushala Daora. Coletada durante missões nas Terras Altas Corais.', 70, 105),
    (228, 'Material de Escama Gélida de Daora', 7, 11, 'Material', 'Material de escama gélida de Kushala Daora. Coletado nas Terras Altas Corais.', 70, 105),
    (229, 'Material de Escama Gélida de Daora', 7, 11, 'Material', 'Material de escama gélida de Kushala Daora. Coletado nas Terras Altas Corais.', 70, 105),
    (230, 'Material de Escama Gélida de Daora', 7, 11, 'Material', 'Material de escama gélida de Kushala Daora. Coletado nas Terras Altas Corais.', 70, 105),
    (231, 'Material de Escama Gélida de Daora', 7, 11, 'Material', 'Material de escama gélida de Kushala Daora. Coletado nas Terras Altas Corais.', 70, 105),
    (232, 'Gema de Wyvern de Pássaro', 7, 11, 'Material', 'Gema rara coletada de Wyverns de Pássaro. Valor inestimável.', 70, 105),
    (233, 'Bitterbug', 1, 8, 'Inseto', 'Inseto amargo coletado na Floresta Antiga.', 10, 15),
    (234, 'Atadura Negra', 1, 11, 'Material', 'Atadura de qualidade feita de pele de Shamos.', 10, 15),
    (235, 'Carapaça de Diablos Negro', 6, 11, 'Material', 'Carapaça de Diablos Negro usada em várias criações.', 60, 90),
    (236, 'Pico Negro +', 6, 11, 'Material', 'Pico aprimorado de Diablos Negro usado em várias criações.', 60, 90),
    (237, 'Chifre Espiral Negro +', 6, 11, 'Material', 'Chifre espiral aprimorado de Diablos Negro usado em várias criações.', 60, 90),
    (238, 'Chifre Bazelgeuse Negro +', 6, 11, 'Material', 'Chifre aprimorado de Bazelgeuse Negro usado em várias criações.', 60, 90),
    (239, 'Noz Explosiva', 1, 11, 'Material', 'Noz coletada na Floresta Antiga, Terras Altas Coralinas, Terras Ermas e Vale Descanso.', 10, 15),
    (240, 'Tesouro de Dragão', 1, 11, 'Material', 'Tesouro raro coletado de Kirin, Nergigante, Xenojiiva e Teostra.', 10, 15),
    (241, 'Minério de Núcleo de Dragão', 10, 11, 'Material', 'Minério obtido ao derrotar Dragões Anciões.', 100, 150),
    (242, 'Baga Dragonfell', 4, 8, 'Planta', 'Baga encontrada no Vale Estrondoso, Vale dos Anciãos, Terras Ermas e Floresta Antiga.', 40, 60),
    (243, 'Osso Selvagem Calcificado', 10, 11, 'Material', 'Osso selvagem extremamente raro. Símbolo de poder selvagem.', 100, 150),
    (244, 'Maçã Divina', 4, 8, 'Fruta', 'Fruta resistente encontrada na Espinha da Terras Altas (Setor Múltiplo).', 40, 60),
    (245, 'Flor do Dragão', 4, 8, 'Planta', 'Flor rara encontrada em cactos redondos na Espinha da Terras Altas (Setor 5).', 40, 60),
    (246, 'Relíquia de Ossos de Dragão', 7, 11, 'Material', 'Relíquia de ossos obtida no Vale dos Anciãos e de Radobaan.', 70, 105),
    (247, 'Minério de Dragonite', 4, 11, 'Material', 'Minério azulado encontrado em afloramentos de minério vermelho em todas as regiões.', 40, 60),
    (248, 'Noz Dragonstrike', 2, 11, 'Material', 'Noz obtida na Floresta Antiga, Vale Estrondoso, Terras Ermas, Vale dos Anciãos e Espinha da Terras Altas.', 20, 30),
    (249, 'Cristal de Dragonvein', 6, 11, 'Material', 'Cristal obtido em afloramentos de minério vermelho na Espinha da Terras Altas (Setor 5).', 60, 90),
    (250, 'Minério de Dreamcore', 7, 11, 'Material', 'Minério raro obtido no Vale dos Anciãos e em missões.', 70, 105),
    (251, 'Dundormarin', 4, 11, 'Material', 'Material misterioso coletado em várias áreas. Seu uso ainda é desconhecido.', 40, 60),
    (252, 'Esterco', 1, 11, 'Material', 'Esterco coletado na Floresta Antiga, Vale Estrondoso, Vale dos Anciãos, Terras Ermas e Espinha da Terras Altas.', 10, 15),
    (253, 'Cristal Terreno', 4, 11, 'Mineral', 'Cristal terreno obtido de afloramentos de minério vermelho na Espinha da Terras Altas.', 40, 60),
    (254, 'Sangue de Dragão Ancião', 7, 11, 'Material', 'Sangue raro de Dragões Anciãos. Obtido de Teostra, Kirin, Kulve Taroth, Vaal Hazak, Xenojiiva, Nergigante e em missões.', 70, 105),
    (255, 'Osso de Dragão Ancião', 7, 11, 'Material', 'Osso raro de Dragões Anciãos. Obtido de Teostra, Kirin, Kulve Taroth, Vaal Hazak, Xenojiiva, Nergigante e em missões.', 70, 105),
    (256, 'Saco de Eletro', 4, 11, 'Material', 'Saco obtido de Tobi-Kadachi. Possui propriedades elétricas.', 40, 60),
    (257, 'Fruta Elysian', 1, 8, 'Fruta', 'Fruta resistente encontrada em cactos na Espinha da Terras Altas (Setor Múltiplo).', 10, 15),
    (258, 'Frasco Vazio', 1, 10, 'Ferramenta', 'Frasco vazio comprado de mercadores.', 10, 15),
    (259, 'Couro Fino Encantado', 11, 11, 'Material', 'Couro de qualidade superior. Usado em criações especiais.', 110, 165),
    (260, 'Placa de Regeneração Eterna', 11, 11, 'Material', 'Placa rara que emana poder regenerativo. Usada em criações especiais.', 110, 165),
    (261, 'Bolsa de Comida', 3, 10, 'Arma', 'Bolsa usada como arma arremessável. Adquirida ao completar Arena Quest 09.', 30, 45),
    (262, 'Fóssil Esquecido', 1, 11, 'Material', 'Fóssil antigo coletado no Vale Putrefato. Seu valor é desconhecido.', 10, 15),
    (263, 'Saco Congelante', 6, 11, 'Material', 'Saco obtido de Legiana. Possui propriedades geladas.', 60, 90),
    (264, 'Saco Gélido', 4, 11, 'Material', 'Saco obtido de Legiana. Possui propriedades frias.', 40, 60),
    (265, 'Minério Fucium', 6, 11, 'Material', 'Minério especial coletado no Vale dos Anciãos e em missões.', 60, 90),
    (266, 'Escama Gajau', 6, 11, 'Material', 'Escama obtida de Gajau. Usada em criações diversas.', 60, 90),
    (267, 'Pele Gajau', 4, 11, 'Material', 'Pele obtida de Gajau. Usada em criações diversas.', 40, 60),
    (268, 'Bigode Gajau', 4, 11, 'Material', 'Bigode obtido de Gajau. Usado em criações diversas.', 40, 60),
    (269, 'Moeda Gama', 3, 10, 'Arma', 'Moeda obtida ao completar Arena Quest 06.', 30, 45),
    (270, 'Carapaça Gastodon', 6, 11, 'Material', 'Carapaça obtida de Gastodon. Usada em criações diversas.', 60, 90),
    (271, 'Chifre Gastodon', 6, 11, 'Material', 'Chifre obtido de Gastodon. Usado em criações diversas.', 60, 90),
    (272, 'Atum Gastodon', 1, 11, 'Material', 'Atum obtido de Gastodon. Usado em criações diversas.', 10, 15),
    (273, 'Grande Escama Sushifish', 4, 11, 'Material', 'Grande escama obtida de Great Sushifish. Usada em criações diversas.', 40, 60),
    (274, 'Pele Girros', 4, 11, 'Material', 'Pele obtida de Girros. Usada em criações diversas.', 40, 60),
    (275, 'Pele Girros +', 6, 11, 'Material', 'Pele aprimorada obtida de Girros. Usada em criações diversas.', 60, 90),
    (276, 'Presas Girros', 4, 11, 'Material', 'Presas obtidas de Girros. Usadas em criações diversas.', 40, 60),
    (277, 'Escama Girros', 4, 11, 'Material', 'Escama obtida de Girros. Usada em criações diversas.', 40, 60),
    (278, 'Escama Girros +', 6, 11, 'Material', 'Escama aprimorada obtida de Girros. Usada em criações diversas.', 60, 90),
    (279, 'Escala Dourada', 4, 11, 'Material', 'Escala brilhante de origem desconhecida. Seu valor é incalculável.', 40, 60),
    (280, 'Escala Dourada +', 4, 11, 'Material', 'Escala brilhante de origem desconhecida. Seu valor é incalculável.', 40, 60),
    (281, 'Concha Ébano Lustrosa', 10, 11, 'Material', 'Concha negra rara com brilho incomum.', 100, 150),
    (282, 'Inseto Divino', 4, 11, 'Material', 'Inseto raro encontrado na Floresta Antiga (Setor ??).', 40, 60),
    (283, 'Peixe Dourado', 4, 11, 'Material', 'Peixe dourado encontrado no Vale Coral, Vale Putrefato e Espinha da Terras Altas.', 40, 60),
    (284, 'Ovo Dourado', 4, 11, 'Material', 'Ovo dourado obtido através de Recompensas Semanais Limitadas.', 40, 60),
    (285, 'Escama Dourada', 4, 11, 'Material', 'Escama dourada brilhante de origem desconhecida.', 40, 60),
    (286, 'Escama Dourada +', 4, 11, 'Material', 'Escama dourada brilhante de origem desconhecida.', 40, 60),
    (287, 'Pele de Rajang Dourado +', 11, 10, 'Arma', 'Pele rara e dourada de Rajang. Usada em criações especiais.', 110, 165),
    (288, 'Escama Bomb Arowana Grande', 4, 11, 'Material', 'Escama especial obtida de Great Bomb Arowana. Usada em criações diversas.', 40, 60),
    (289, 'Bigode Gajau Grandioso', 4, 11, 'Material', 'Bigode obtido de Gajau. Grande e valioso.', 40, 60),
    (290, 'Presas Grandes de Girros', 4, 11, 'Material', 'Presas obtidas de Great Girros. Usadas em criações diversas.', 40, 60),
    (291, 'Pele Grande de Girros', 4, 11, 'Material', 'Pele obtida de Great Girros. Usada em criações diversas.', 40, 60),
    (292, 'Pele Grande de Girros +', 6, 11, 'Material', 'Pele aprimorada obtida de Great Girros. Usada em criações diversas.', 60, 90),
    (293, 'Capuz de Girros Grandioso', 4, 11, 'Material', 'Capuz obtido de Great Girros. Grande e valioso.', 40, 60),
    (294, 'Capuz de Girros Grandioso +', 6, 11, 'Material', 'Capuz aprimorado obtido de Great Girros. Grande e valioso.', 60, 90),
    (295, 'Escama de Girros Grande', 4, 11, 'Material', 'Escama obtida de Great Girros. Usada em criações diversas.', 40, 60),
    (296, 'Escama de Girros Grande +', 6, 11, 'Material', 'Escama aprimorada obtida de Great Girros. Usada em criações diversas.', 60, 90),
    (297, 'Cauda de Girros Grande', 1, 11, 'Material', 'Cauda obtida de Great Girros. Grande e valiosa.', 10, 15),
    (298, 'Mosca de Chifre Grande', 5, 11, 'Material', 'Mosca rara obtida através da Pesquisa Botânica.', 50, 75),
    (299, 'Garra + de Jagras Grande', 6, 11, 'Material', 'Garra aprimorada obtida de Great Jagras. Usada em criações diversas.', 60, 90),
    (300, 'Garra de Jagras Grande', 4, 11, 'Material', 'Garra obtida de Great Jagras. Usada em criações diversas.', 40, 60),
    (301, 'Pele + de Jagras Grande', 6, 11, 'Material', 'Pele aprimorada obtida de Great Jagras. Usada em criações diversas.', 60, 90),
    (302, 'Pele de Jagras Grande', 4, 11, 'Material', 'Pele obtida de Great Jagras. Usada em criações diversas.', 40, 60),
    (303, 'Crina de Jagras Grande', 4, 11, 'Material', 'Crina obtida de Great Jagras. Usada em criações diversas.', 40, 60),
    (304, 'Escama de Jagras Grande', 4, 11, 'Material', 'Escama obtida de Great Jagras. Usada em criações diversas.', 40, 60),
    (305, 'Escama de Jagras Grande +', 6, 11, 'Material', 'Escama aprimorada obtida de Great Jagras. Usada em criações diversas.', 60, 90),
    (306, 'Escama de Rajang Explosivo', 4, 11, 'Material', 'Escama especial obtida de Great Burst Arowana. Usada em criações diversas.', 40, 60),
    (307, 'Gema Grande Espírito da Veia', 11, 11, 'Material', 'Gema extremamente rara que contém um espírito poderoso.', 110, 165),
    (308, 'Pólvora Nível 2', 2, 9, 'Item de Criação', 'Pólvora de alto nível criada na forja.', 20, 30),
    (309, 'Pólvora Nível 3', 2, 9, 'Item de Criação', 'Pólvora de nível avançado criada na forja.', 20, 30),
    (310, 'Escama de Gunpowderfish', 3, 11, 'Material', 'Escama obtida de Gunpowderfish. Usada em criações diversas.', 30, 45),
    (311, 'Osso Guia Vulcânico', 11, 11, 'Material', 'Osso guia vulcânico coletado nas Terras Altas Guiding.', 110, 165),
    (312, 'Cristal Rímeo Guia', 11, 11, 'Material', 'Cristal rímeo coletado nas Terras Altas Guiding.', 110, 165),
    (313, 'Grande Escama Gunpowderfish', 4, 11, 'Material', 'Grande escama obtida de Gunpowderfish. Usada em criações diversas.', 40, 60),
    (314, 'Esfera de Armadura Dura', 7, 9, 'Item de Criação', 'Esfera usada para fortalecer equipamentos de forma excepcional.', 70, 105),
    (315, 'Pólvora de Casca Dura', 4, 9, 'Item de Criação', 'Pólvora obtida através de criação ou na Anciã de Meld', 40, 60),
    (316, 'Fruta Dura', 5, 11, 'Material', 'Fruta resistente encontrada na Espinha da Terras Altas (Setor ??).', 50, 75),
    (317, 'Fruta Celestial', 5, 11, 'Material', 'Fruta celestial encontrada na Espinha da Terras Altas (Setor ??).', 50, 75),
    (318, 'Esfera de Armadura Pesada', 7, 9, 'Item de Criação', 'Esfera usada para fortalecer equipamentos de forma excepcional.', 70, 105),
    (319, 'Alabarda do Herói: Espada', 7, 10, 'Arma', 'Fragmento de herói obtido através de monstros mais fortes em ameaças temperadas.', 70, 105),
    (320, 'Alabarda do Herói: Lâmina', 7, 10, 'Arma', 'Fragmento de herói obtido através de monstros mais fortes em ameaças temperadas.', 70, 105),
    (321, 'Alabarda do Herói: Martelo', 7, 10, 'Arma', 'Fragmento de herói obtido através de monstros mais fortes em ameaças temperadas.', 70, 105),
    (322, 'Alabarda do Herói: Lança', 7, 10, 'Arma', 'Fragmento de herói obtido através de monstros mais fortes em ameaças temperadas.', 70, 105),
    (323, 'Alabarda do Herói: Machado', 7, 10, 'Arma', 'Fragmento de herói obtido através de monstros mais fortes em ameaças temperadas.', 70, 105),
    (324, 'Alabarda do Herói: Eixo', 7, 10, 'Arma', 'Fragmento de herói obtido através de monstros mais fortes em ameaças temperadas.', 70, 105),
    (325, 'Alabarda do Herói: Ranged', 7, 10, 'Arma', 'Fragmento de herói obtido através de monstros mais fortes em ameaças temperadas.', 70, 105),
    (326, 'Recomendação Alta', 7, 11, 'Material', 'Recompensa por completar missões ou investigações especiais de alto nível.', 70, 105),
    (327, 'Pele de Qualidade Superior', 6, 11, 'Material', 'Pele de pequenos animais obtida através da Pesquisa Botânica.', 60, 90),
    (328, 'Mel', 2, 11, 'Material', 'Mel coletado em várias localizações (Floresta Antiga, Vale Deserto, etc.).', 20, 30),
    (329, 'Carapaça de Hornetaur', 6, 11, 'Material', 'Carapaça obtida de Hornetaur. Usada em criações diversas.', 60, 90),
    (330, 'Cabeça de Hornetaur', 4, 11, 'Material', 'Cabeça obtida de Hornetaur. Usada em criações diversas.', 40, 60),
    (331, 'Asa Interna de Hornetaur', 0, 11, 'Material', 'Asa interna obtida de Hornetaur.', 40, 60),
    (332, 'Concha de Hornetaur', 4, 11, 'Material', 'Concha obtida de Hornetaur. Usada em criações diversas.', 40, 60),
    (333, 'Moeda do Rei Caçador', 4, 11, 'Material', 'Moeda de alto valor obtida em Arena Quests 05/06/07.', 40, 60),
    (334, 'Escama de Dragão Imortal', 7, 11, 'Material', 'Escama de dragão imortal obtida de Nergigante. Usada em criações diversas.', 70, 105),
    (335, 'Fragmento Imortal', 11, 11, 'Material', 'Fragmento raro e imortal coletado de monstros poderosos.', 110, 165),
    (336, 'Sacola Infernal', 6, 11, 'Material', 'Sacola quente obtida de Anjanath, Rathian, Pink Rathian, Rathalos, Uragaan, Lavasioth e em missões especiais.', 60, 90),
    (337, 'Minério de Ferro', 4, 11, 'Material', 'Minério de ferro coletado na Floresta Antiga (Setor ??).', 40, 60),
    (338, 'Ivy', 1, 11, 'Material', 'Erva coletada no Vale Putrefato (Rotten Vale).', 10, 15),
    (339, 'Pele de Jagras', 4, 11, 'Material', 'Pele coletada de Jagras. Usada em criações diversas.', 40, 60),
    (340, 'Pele + de Jagras', 6, 11, 'Material', 'Pele aprimorada coletada de Jagras. Usada em criações diversas.', 60, 90),
    (341, 'Escama de Jagras', 4, 11, 'Material', 'Escama coletada de Jagras. Usada em criações diversas.', 40, 60),
    (342, 'Escama + de Jagras', 6, 11, 'Material', 'Escama aprimorada coletada de Jagras. Usada em criações diversas.', 60, 90),
    (343, 'Cacto Joia', 0, 11, 'Material', 'Cacto encontrado na Espinha da Terras Altas (Setor 5).', 40, 60),
    (344, 'Dente de Jyuratodus', 4, 11, 'Material', 'Dente obtido de Jyuratodus. Usado em criações diversas.', 40, 60),
    (345, 'Dente + de Jyuratodus', 6, 11, 'Material', 'Dente aprimorado obtido de Jyuratodus. Usado em criações diversas.', 60, 90),
    (346, 'Barbatana de Jyuratodus', 4, 11, 'Material', 'Barbatana obtida de Jyuratodus. Usada em criações diversas.', 40, 60),
    (347, 'Barbatana + de Jyuratodus', 6, 11, 'Material', 'Barbatana aprimorada obtida de Jyuratodus. Usada em criações diversas.', 60, 90),
    (348, 'Escama de Jyuratodus', 4, 11, 'Material', 'Escama obtida de Jyuratodus. Usada em criações diversas.', 40, 60),
    (349, 'Escama + de Jyuratodus', 6, 11, 'Material', 'Escama aprimorada obtida de Jyuratodus. Usada em criações diversas.', 60, 90),
    (350, 'Concha de Jyuratodus', 4, 11, 'Material', 'Concha obtida de Jyuratodus. Usada em criações diversas.', 40, 60),
    (351, 'Kelbi Chifre', 0, 11, 'Material', 'Chifre obtido de Kelbi. Usado em criações diversas.', 10, 15),
    (352, 'Carapaça de Kestodon', 6, 11, 'Material', 'Carapaça obtida de Kestodon. Usada em criações diversas.', 60, 90),
    (353, 'Crânio de Kestodon', 4, 11, 'Material', 'Crânio obtido de Kestodon. Usado em criações diversas.', 40, 60),
    (354, 'Concha de Kestodon', 4, 11, 'Material', 'Concha obtida de Kestodon. Usada em criações diversas.', 40, 60),
    (355, 'Chifre Azure do Kirin', 0, 11, 'Material', 'Chifre azul obtido de Kirin.', 10, 15),
    (356, 'Pele Fina do Kirin', 11, 11, 'Material', 'Pele fina obtida de Kirin. Usada em criações diversas.', 110, 165),
    (357, 'Pele de Kirin', 0, 11, 'Material', 'Pele obtida de Kirin. Usada em criações diversas.', 10, 15),
    (358, 'Pele + de Kirin', 0, 11, 'Material', 'Pele aprimorada obtida de Kirin. Usada em criações diversas.', 10, 15),
    (359, 'Crina de Kirin', 0, 11, 'Material', 'Crina obtida de Kirin. Usada em criações diversas.', 10, 15),
    (360, 'Prata Mane de Kirin', 11, 11, 'Material', 'Prata mane obtida de Kirin. Usada em criações diversas.', 110, 165),
    (361, 'Cauda de Kirin', 0, 11, 'Material', 'Cauda obtida de Kirin. Usada em criações diversas.', 10, 15),
    (362, 'Chifre Trovejante de Kirin', 0, 11, 'Material', 'Chifre trovejante obtido de Kirin. Usado em criações diversas.', 10, 15),
    (363, 'Cauda Trovejante de Kirin', 0, 11, 'Material', 'Cauda trovejante obtida de Kirin. Usada em criações diversas.', 10, 15),
    (364, 'Cauda Trovejante + de Kirin', 11, 11, 'Material', 'Cauda trovejante aprimorada obtida de Kirin. Usada em criações diversas.', 110, 165),
    (365, 'Cacto Real', 0, 11, 'Material', 'Cacto encontrado na Espinha da Terras Altas (Setor ??).', 10, 15),
    (366, 'Moeda de Kulu', 4, 11, 'Arena (Kulu-Ya-Ku)', 'Moeda com valor de alto nível obtida em Arena Quests (Kulu-Ya-Ku).', 40, 60),
    (367, 'Bico de Kulu-Ya-Ku', 4, 11, 'Material', 'Bico obtido de Kulu-Ya-Ku (Break Head). Usado em criações diversas.', 40, 60),
    (368, 'Bico + de Kulu-Ya-Ku', 6, 11, 'Material', 'Bico aprimorado obtido de Kulu-Ya-Ku. Usado em criações diversas.', 60, 90),
    (369, 'Pele de Kulu-Ya-Ku', 4, 11, 'Material', 'Pele obtida de Kulu-Ya-Ku (Body). Usada em criações diversas.', 40, 60),
    (370, 'Pele + de Kulu-Ya-Ku', 6, 11, 'Material', 'Pele aprimorada obtida de Kulu-Ya-Ku. Usada em criações diversas.', 60, 90),
    (371, 'Penacho de Kulu-Ya-Ku', 4, 11, 'Material', 'Penacho obtido de Kulu-Ya-Ku (Break Forelimbs). Usado em criações diversas.', 40, 60),
    (372, 'Penacho + de Kulu-Ya-Ku', 6, 11, 'Material', 'Penacho aprimorado obtido de Kulu-Ya-Ku. Usado em criações diversas.', 60, 90),
    (373, 'Escama de Kulu-Ya-Ku', 4, 11, 'Material', 'Escama obtida de Kulu-Ya-Ku (Reward). Usada em criações diversas.', 40, 60),
    (374, 'Escama + de Kulu-Ya-Ku', 6, 11, 'Material', 'Escama aprimorada obtida de Kulu-Ya-Ku. Usada em criações diversas.', 60, 90),
    (375, 'Barril Grande', 2, 11, 'Material', 'Barril grande utilizado em missões e eventos.', 20, 30),
    (376, 'Lágrima Grande de Wyvern', 6, 11, 'Material', 'Lágrima grande obtida de Rathian Rosa. Usada em criações diversas.', 60, 90),
    (377, 'Lavaball', 6, 11, 'Material', 'Núcleo de lava obtido de Uragaan. Usado em criações diversas.', 60, 90),
    (378, 'Carapaça de Lavasioth', 0, 11, 'Material', 'Carapaça obtida de Lavasioth. Usada em criações diversas.', 10, 15),
    (379, 'Presinha + de Lavasioth', 6, 11, 'Material', 'Presinha aprimorada obtida de Lavasioth. Usada em criações diversas.', 60, 90),
    (380, 'Barbatana + de Lavasioth', 6, 11, 'Material', 'Barbatana aprimorada obtida de Lavasioth. Usada em criações diversas.', 60, 90),
    (381, 'Escama + de Lavasioth', 6, 11, 'Material', 'Escama aprimorada obtida de Lavasioth. Usada em criações diversas.', 60, 90),
    (382, 'Garra de Legiana', 4, 11, 'Material', 'Garra obtida de Legiana (??) . Usada em criações diversas.', 40, 60),
    (383, 'Garra + de Legiana', 6, 11, 'Material', 'Garra aprimorada obtida de Legiana. Usada em criações diversas.', 60, 90),
    (384, 'Gema de Legiana', 0, 11, 'Material', 'Gema rara obtida de Legiana.', 10, 15),
    (385, 'Pele de Legiana', 4, 11, 'Material', 'Pele obtida de Legiana (Reward) . Usada em criações diversas.', 40, 60),
    (386, 'Pele + de Legiana', 6, 11, 'Material', 'Pele aprimorada obtida de Legiana. Usada em criações diversas.', 60, 90),
    (387, 'Placa de Legiana', 5, 11, 'Material', 'Placa obtida de Legiana (Body) . Usada em criações diversas.', 50, 75),
    (388, 'Escama de Legiana', 4, 11, 'Material', 'Escama obtida de Legiana (Body) . Usada em criações diversas.', 40, 60),
    (389, 'Escama + de Legiana', 6, 11, 'Material', 'Escama aprimorada obtida de Legiana (Body) . Usada em criações diversas.', 60, 90),
    (390, 'Teia Caudal de Legiana', 4, 11, 'Material', 'Teia caudal obtida de Legiana (??) . Usada em criações diversas.', 40, 60),
    (391, 'Teia de Legiana', 4, 11, 'Material', 'Teia obtida de Legiana (??) . Usada em criações diversas.', 40, 60),
    (392, 'Asa de Legiana', 0, 11, 'Material', 'Asa obtida de Legiana.', 10, 15),
    (393, 'Cristal de Luz', 5, 11, 'Material', 'Cristal azul obtido de Depósitos de Mineração (Todas as Regiões) (Chance R).', 50, 75),
    (394, 'Minério Loc Lac', 5, 11, 'Material', 'Minério comprado com o Capitão Argosy.', 50, 75),
    (395, 'Cristal de Magma', 11, 11, 'Material', 'Cristal obtido em Lavas da Guilda. Muito raro.', 110, 165),
    (396, 'Minério de Machalita', 4, 11, 'Material', 'Minério de Machalita coletado na Floresta Antiga (Setor ??).', 40, 60),
    (397, 'Chifre Majestoso', 0, 11, 'Material', 'Chifre raro obtido de Diablos. Usado em criações diversas.', 10, 15),
    (398, 'Mandrágora', 3, 11, 'Material', 'Mandrágora obtida em missões.', 30, 45),
    (399, 'Cristal Derretido', 9, 11, 'Material', 'Cristal derretido obtido em lavas muito quentes.', 90, 135),
    (400, 'Escudo Metálico', 10, 11, 'Material', 'Escudo metálico obtido de monstros de metal. Usado em criações diversas.', 100, 150),
    (401, 'Semente de Poder', 2, 11, 'Material', 'Semente obtida através da coleta de ervas na Espinha da Terra Altas (Setor ??).', 20, 30),
    (402, 'Minegardênia', 0, 11, 'Material', 'Objeto coletado em jardins de mineração da guilda.', 10, 15),
    (403, 'Osso Monstro +', 4, 11, 'Material', 'Recompensa de missões de caça a monstros de alto nível (HR 9+).', 40, 60),
    (404, 'Osso Monstro S', 4, 11, 'Material', 'Osso coletado em pilhas de ossos na Floresta Antiga (Setor ??).', 40, 60),
    (405, 'Osso Monstro M', 4, 11, 'Material', 'Recompensa de missões de caça a monstros de nível baixo a médio (HR 2-6).', 40, 60),
    (406, 'Osso Monstro L', 4, 11, 'Material', 'Recompensa de missões de caça a monstros de nível médio a alto (HR 6+).', 40, 60),
    (407, 'Caldo de Monstro', 6, 11, 'Material', 'Fluido obtido de Hornetaur e Vespoid. Usado em criações diversas.', 60, 90),
    (408, 'Fluido de Monstro', 4, 11, 'Material', 'Fluido coletado de criaturas insetoides, com baixa taxa de queda.', 40, 60),
    (409, 'Osso Afiado de Monstro', 6, 11, 'Material', 'Osso obtido de missões de caça a monstros de alto nível (HR 9+).', 60, 90),
    (410, 'Osso Duro de Monstro', 6, 11, 'Material', 'Osso obtido de missões de caça a monstros de alto nível (Black Diablos e Uragaan).', 60, 90),
    (411, 'Pele de Mosswine', 4, 11, 'Material', 'Pele obtida de Mosswine (Body) (~50%).', 40, 60),
    (412, 'Nutrientes Mega', 5, 11, 'Material', 'Nutrientes de alta qualidade, criados através de combinação.', 50, 75),
    (413, 'Agulha de Erva', 1, 11, 'Material', 'Agulha comum obtida em diversos mapas.', 10, 15),
    (414, 'Carapaça de Nergigante', 7, 11, 'Material', 'Carapaça obtida de Nergigante (??) .', 70, 105),
    (415, 'Córtex de Nergigante', 11, 11, 'Material', 'Córtex raro obtido de Nergigante.', 110, 165),
    (416, 'Flagelo de Nergigante', 11, 11, 'Material', 'Flagelo obtido de Nergigante. Usado em criações diversas.', 110, 165),
    (417, 'Gema de Nergigante', 0, 11, 'Material', 'Gema obtida de Nergigante.', 10, 15),
    (418, 'Chifre + de Nergigante', 7, 11, 'Material', 'Chifre aprimorado obtido de Nergigante (??) .', 70, 105),
    (419, 'Garra Dura de Nergigante', 11, 11, 'Material', 'Garra dura obtida de Nergigante (R Drops) .', 110, 165),
    (420, 'Placa de Regeneração de Nergigante', 7, 11, 'Material', 'Placa obtida de Nergigante (R Drops) .', 70, 105),
    (421, 'Cauda de Nergigante', 7, 11, 'Material', 'Cauda obtida de Nergigante (Break Tail) .', 70, 105),
    (422, 'Talão de Nergigante', 7, 11, 'Material', 'Talão obtido de Nergigante (Body) .', 70, 105),
    (423, 'Nitrofungo', 2, 11, 'Material', 'Cogumelo explosivo comum em Wildspire Waste.', 20, 30),
    (424, 'Extrato Nutritivo', 4, 11, 'Material', 'Obtido de Odogaron, Paolumu, Dodogama. Usado em criações diversas.', 40, 60),
    (425, 'Cristal Nova', 7, 11, 'Material', 'Cristal obtido de Depósitos de Mineração Vermelhos (Todas as Regiões) (Chance R).', 70, 105),
    (426, 'Amora-de-Fogo', 2, 11, 'Material', 'Coleta de ervas em Ancient Forest, Wildspire Waste, Coral Highlands, Rotten Vale.', 20, 30),
    (427, 'Nutrientes', 2, 11, 'Material', 'Nutrientes criados através de combinação.', 20, 30),
    (428, 'Garra de Odogaron', 4, 11, 'Material', 'Garra obtida de Odogaron (Break Forelegs) .', 40, 60),
    (429, 'Garra + de Odogaron', 6, 11, 'Material', 'Garra aprimorada obtida de Odogaron.', 60, 90),
    (430, 'Presinha de Odogaron', 4, 11, 'Material', 'Presinha obtida de Odogaron (??) .', 40, 60),
    (431, 'Presinha + de Odogaron', 6, 11, 'Material', 'Presinha aprimorada obtida de Odogaron.', 60, 90),
    (432, 'Gema de Odogaron', 0, 11, 'Material', 'Gema rara obtida de Odogaron.', 10, 15),
    (433, 'Dente Duro de Odogaron', 10, 11, 'Material', 'Dente duro obtido de Odogaron.', 100, 150),
    (434, 'Placa de Odogaron', 5, 11, 'Material', 'Placa obtida de Odogaron (??) .', 50, 75),
    (435, 'Escama de Odogaron', 4, 11, 'Material', 'Escama obtida de Odogaron (Body) .', 40, 60),
    (436, 'Escama + de Odogaron', 6, 11, 'Material', 'Escama aprimorada obtida de Odogaron.', 60, 90),
    (437, 'Tendão de Odogaron', 4, 11, 'Material', 'Tendão obtido de Odogaron (Reward) .', 40, 60),
    (438, 'Tendão + de Odogaron', 6, 11, 'Material', 'Tendão aprimorado obtido de Odogaron.', 60, 90),
    (439, 'Cauda de Odogaron', 4, 11, 'Material', 'Cauda obtida de Odogaron (Tail) .', 40, 60),
    (440, 'Saco Onírico', 6, 11, 'Material', 'Obtido de Great Girros. Usado em criações diversas.', 60, 90),
    (441, 'Carapaça + de Paolumu', 6, 11, 'Material', 'Carapaça aprimorada obtida de Paolumu.', 60, 90),
    (442, 'Pele de Paolumu', 4, 11, 'Material', 'Pele obtida de Paolumu (Reward) .', 40, 60),
    (443, 'Pele + de Paolumu', 6, 11, 'Material', 'Pele aprimorada obtida de Paolumu.', 60, 90),
    (444, 'Escama de Paolumu', 4, 11, 'Material', 'Escama obtida de Paolumu (Body) .', 40, 60),
    (445, 'Escama + de Paolumu', 6, 11, 'Material', 'Escama aprimorada obtida de Paolumu.', 60, 90),
    (446, 'Concha de Paolumu', 4, 11, 'Material', 'Concha obtida de Paolumu (Break Tail) .', 40, 60),
    (447, 'Pelagem Espessa de Paolumu', 9, 11, 'Material', 'Pelagem densa obtida de Paolumu.', 90, 135),
    (448, 'Membrana de Paolumu', 4, 11, 'Material', 'Membrana obtida de Paolumu (Break Wings) .', 40, 60),
    (449, 'Asa de Paolumu', 6, 11, 'Material', 'Asa obtida de Paolumu.', 60, 90),
    (450, 'Saco de Paralisia', 4, 11, 'Material', 'Obtido de Great Girros. Usado em criações diversas.', 40, 60),
    (451, 'Cogumelo Parashroom', 3, 11, 'Material', 'Cogumelo comum encontrado em Ancient Forest.', 30, 45),
    (452, 'Ostra Pérola', 5, 11, 'Material', 'Ostra Pérola obtida em Coral Highlands, Área 11 no topo da cachoeira.', 50, 75),
    (453, 'Escama de Platina', 0, 11, 'Material', 'Escama obtida de Platinumfish.', 10, 15),
    (454, 'Escama + de Platina', 0, 11, 'Material', 'Escama aprimorada obtida de Platinumfish.', 10, 15),
    (455, 'Garra Perfurante', 6, 11, 'Material', 'Garra obtida de Girros, Jagras, Shamos.', 60, 90),
    (456, 'Carapaça de Rathian Rosa', 6, 11, 'Material', 'Carapaça obtida de Rathian Rosa.', 60, 90),
    (457, 'Escama + de Rathian Rosa', 6, 11, 'Material', 'Escama aprimorada obtida de Rathian Rosa.', 60, 90),
    (458, 'Pérola de Platina', 0, 11, 'Material', 'Pérola obtida de Platinumfish.', 10, 15),
    (459, 'Pérola + de Platina', 0, 11, 'Material', 'Pérola aprimorada obtida de Platinumfish.', 10, 15),
    (460, 'Garra Perfurante', 6, 11, 'Material', 'Garra obtida de Girros, Jagras, Shamos.', 60, 90),
    (461, 'Carapaça de Rathian Rosa', 6, 11, 'Material', 'Carapaça obtida de Rathian Rosa.', 60, 90),
    (462, 'Escama + de Rathian Rosa', 6, 11, 'Material', 'Escama aprimorada obtida de Rathian Rosa.', 60, 90),
    (463, 'Rathian Rosa +', 6, 11, 'Material', 'Escama aprimorada obtida de Rathian Rosa.', 60, 90),
    (464, 'Pérola de Platina', 0, 11, 'Material', 'Pérola obtida de Platinumfish.', 10, 15),
    (465, 'Pérola + de Platina', 0, 11, 'Material', 'Pérola aprimorada obtida de Platinumfish.', 10, 15),
    (466, 'Garra Perfurante', 6, 11, 'Material', 'Garra obtida de Girros, Jagras, Shamos.', 60, 90),
    (467, 'Carapaça de Rathian Rosa', 6, 11, 'Material', 'Carapaça obtida de Rathian Rosa.', 60, 90),
    (468, 'Escama + de Rathian Rosa', 6, 11, 'Material', 'Escama aprimorada obtida de Rathian Rosa.', 60, 90),
    (469, 'Pod Perfurante', 0, 11, 'Material', 'Projétil que perfura o corpo do alvo. Usado automaticamente pelo jogador.', 10, 15),
    (470, 'Moeda Pinnacle', 4, 11, 'Material', 'Moeda obtida ao alcançar uma patente mais alta durante missões de arena.', 40, 60),
    (471, 'Saco de Veneno', 4, 11, 'Material', 'Obtido de Pukei-Pukei . Usado em criações diversas.', 40, 60),
    (472, 'Moeda de Pukei-Pukei', 4, 11, 'Material', 'Moeda obtida em missões de arena (Pukei-Pukei).', 40, 60),
    (473, 'Pena de Pukei-Pukei', 4, 11, 'Material', 'Pena obtida de Pukei-Pukei (Break Wings) .', 40, 60),
    (474, 'Saco de Pukei-Pukei', 6, 11, 'Material', 'Saco obtido de Pukei-Pukei (Break Head) .', 60, 90),
    (475, 'Saco + de Pukei-Pukei', 6, 11, 'Material', 'Saco aprimorado obtido de Pukei-Pukei (Break Head) .', 60, 90),
    (476, 'Escama de Pukei-Pukei', 4, 11, 'Material', 'Escama obtida de Pukei-Pukei (Body) .', 40, 60),
    (477, 'Escama + de Pukei-Pukei', 6, 11, 'Material', 'Escama aprimorada obtida de Pukei-Pukei (Body) .', 60, 90),
    (478, 'Concha de Pukei-Pukei', 4, 11, 'Material', 'Concha obtida de Pukei-Pukei (Reward) .', 40, 60),
    (479, 'Carapaça de Pukei-Pukei', 6, 11, 'Material', 'Carapaça obtida de Pukei-Pukei (Body)  (High Rank).', 60, 90),
    (480, 'Cauda de Pukei-Pukei', 4, 11, 'Material', 'Cauda obtida de Pukei-Pukei (Tail) .', 40, 60),
    (481, 'Asa de Pukei-Pukei', 6, 11, 'Material', 'Asa obtida de Pukei-Pukei (Break Wings) .', 60, 90),
    (482, 'Osso de Qualidade', 6, 11, 'Material', 'Osso obtido de pilhas de ossos em Wildspire Spine (Sector 15).', 60, 90),
    (483, 'Garra Dura de Rajang', 11, 11, 'Material', 'Garra dura obtida de Rajang.', 110, 165),
    (484, 'Presinha Dura de Rajang', 10, 11, 'Material', 'Presinha dura obtida de Rajang.', 100, 150),
    (485, 'Chifre Duro de Rajang', 11, 11, 'Material', 'Chifre duro obtido de Rajang.', 110, 165),
    (486, 'Cauda de Rajang', 11, 11, 'Material', 'Cauda obtida de Rajang.', 110, 165),
    (487, 'Pelagem Selvagem de Rajang', 11, 11, 'Material', 'Pelagem selvagem obtida de Rajang.', 110, 165),
    (488, 'Medula de Radobaan', 6, 11, 'Material', 'Medula obtida de Radobaan (Body) .', 60, 90),
    (489, 'Óleo de Radobaan', 4, 11, 'Material', 'Óleo obtido de Radobaan (Break Tail) .', 40, 60),
    (490, 'Escama de Radobaan', 4, 11, 'Material', 'Escama obtida de Radobaan (Body) .', 40, 60),
    (491, 'Escama + de Radobaan', 6, 11, 'Material', 'Escama aprimorada obtida de Radobaan(Body) .', 60, 90),
    (492, 'Concha de Radobaan', 4, 11, 'Material', 'Concha obtida de Radobaan (Reward) .', 40, 60),
    (493, 'Carapaça de Radobaan', 6, 11, 'Material', 'Carapaça obtida de Radobaan (Reward) .', 60, 90),
    (494, 'Garra de Rathalos', 4, 11, 'Material', 'Garra obtida de Rathalos & Rathian (Break Wings) .', 40, 60),
    (495, 'Carapaça de Rathalos', 6, 11, 'Material', 'Carapaça obtida de Rathalos.', 60, 90),
    (496, 'Moeda de Rathalos', 0, 11, 'Material', 'Moeda obtida em missões de arena (Rathalos).', 10, 15),
    (497, 'Medula de Rathalos', 4, 11, 'Material', 'Medula obtida de Rathalos .', 40, 60),
    (498, 'Placa de Rathalos', 5, 11, 'Material', 'Placa obtida de Rathalos (Body) .', 50, 75),
    (499, 'Rubi de Rathalos', 7, 11, 'Material', 'Rubi obtido de Rathalos.', 70, 105),
    (500, 'Escama de Rathalos', 4, 11, 'Material', 'Escama obtida de Rathalos (Body) .', 40, 60),
    (501, 'Escama + de Rathalos', 6, 11, 'Material', 'Escama aprimorada obtida de Rathalos Scale.', 60, 90),
    (502, 'Concha de Rathalos', 4, 11, 'Material', 'Concha obtida de Rathalos (Reward) .', 40, 60),
    (503, 'Carapaça de Rathalos', 6, 11, 'Material', 'Carapaça obtida de Rathalos (Reward) .', 60, 90),
    (504, 'Cauda de Rathalos', 4, 11, 'Material', 'Cauda obtida de Rathalos (Break Tail) .', 40, 60),
    (505, 'Asa de Rathalos', 6, 11, 'Material', 'Asa obtida de Rathalos (breaking wings).', 60, 90),
    (506, 'Carapaça de Rathian', 6, 11, 'Material', 'Carapaça obtida de Rathian.', 60, 90),
    (507, 'Moeda de Rathian', 0, 11, 'Material', 'Moeda obtida em missões de arena (Rathian).', 10, 15),
    (508, 'Placa de Rathian', 4, 11, 'Material', 'Placa obtida de Rathian (??) .', 40, 60),
    (509, 'Rubi de Rathian', 6, 11, 'Material', 'Rubi obtido de Rathian.', 60, 90),
    (510, 'Escama de Rathian', 4, 11, 'Material', 'Escama obtida de Rathian (??) .', 40, 60),
    (511, 'Escama + de Rathian', 6, 11, 'Material', 'Escama aprimorada obtida de Rathian.', 60, 90),
    (512, 'Concha de Rathian', 4, 11, 'Material', 'Concha obtida de Rathian (Reward) .', 40, 60),
    (513, 'Crista de Rathian', 6, 11, 'Material', 'Crista obtida de Rathian (Break Tail) .', 60, 90),
    (514, 'Crista + de Rathian', 6, 11, 'Material', 'Crista aprimorada obtida de Rathian.', 60, 90),
    (515, 'Escama de Rathian', 4, 11, 'Material', 'Escama obtida de Rathian (??) .', 40, 60),
    (516, 'Escama + de Rathian', 6, 11, 'Material', 'Escama aprimorada obtida de Rathian.', 60, 90),
    (517, 'Crista de Rathian', 6, 11, 'Material', 'Crista obtida de Rathian (Break Tail) .', 60, 90),
    (518, 'Crista + de Rathian', 6, 11, 'Material', 'Crista aprimorada obtida de Rathian.', 60, 90),
    (519, 'Rubi de Rathian', 6, 11, 'Material', 'Rubi obtido de Rathian.', 60, 90),
    (520, 'Carapaça de Rathian', 6, 11, 'Material', 'Carapaça obtida de Rathian.', 60, 90),
    (521, 'Espigão de Rathian', 6, 11, 'Material', 'Espigão obtido de Rathian .', 60, 90),
    (522, 'Asa de Rathian', 6, 11, 'Material', 'Asa obtida de Rathian .', 60, 90),
    (523, 'Carapaça de Pukei-Pukei', 6, 11, 'Material', 'Carapaça obtida de Pukei-Pukei (Body)  (High Rank).', 60, 90),
    (524, 'Cauda de Pukei-Pukei', 4, 11, 'Material', 'Cauda obtida de Pukei-Pukei (Tail) .', 40, 60),
    (525, 'Asa de Pukei-Pukei', 6, 11, 'Material', 'Asa obtida de Pukei-Pukei (Break Wings) .', 60, 90),
    (526, 'Concha Emborrachada', 9, 11, 'Material', 'Concha emborrachada obtida de Paolumu.', 90, 135),
    (527, 'Concha Emborrachada', 9, 11, 'Material', 'Concha emborrachada obtida de Paolumu.', 90, 135),
    (528, 'Saco Uivante', 4, 11, 'Material', 'Saco obtido de Shamos.', 40, 60),
    (529, 'Pelego de Shamos', 4, 11, 'Material', 'Pele obtida de Shamos (Coral Highlands).', 40, 60),
    (530, 'Pelego + de Shamos', 6, 11, 'Material', 'Pele aprimorada obtida de Shamos (Coral Highlands).', 60, 90),
    (531, 'Escama de Shamos', 4, 11, 'Material', 'Escama obtida de Shamuos (Coral Highlands) .', 40, 60),
    (532, 'Escama + de Shamos', 6, 11, 'Material', 'Escama aprimorada obtida de Shamos (Coral Highlands).', 60, 90),
    (533, 'Garra Afiada', 4, 11, 'Material', 'Garra obtida de Girros, Jagras, Shamos.', 40, 60),
    (534, 'Tecido Sinistro', 5, 11, 'Material', 'Obtido como recompensa da Tailrider Safari.', 50, 75),
    (535, 'Ovo de Prata', 0, 11, 'Material', 'Ovo de prata obtido em missões ou expedições.', 10, 15),
    (536, 'Osso Selvagem Borbulhante', 9, 11, 'Material', 'Osso selvagem borbulhante obtido em locais selvagens.', 90, 135),
    (537, 'Flor Brilhante', 0, 11, 'Material', 'Flor brilhante encontrada em várias regiões.', 10, 15),
    (538, 'Munição de Corte', 1, 11, 'Material', 'Material usado em combate a distância.', 10, 15),
    (539, 'Erva do Sono', 2, 11, 'Material', 'Erva com propriedades soníferas encontrada em muitos mapas.', 20, 30),
    (540, 'Saco do Sono', 4, 11, 'Material', 'Saco obtido de Radobaan.', 40, 60),
    (541, 'Barril Pequeno', 1, 11, 'Material', 'Barril pequeno usado em missões.', 10, 15),
    (542, 'Peixe Dourado Pequeno', 0, 11, 'Material', 'Peixe dourado pequeno encontrado na Vale Pestilenta (Área 15).', 10, 15),
    (543, 'Noz Fumegante', 1, 11, 'Material', 'Noz fumegante encontrada em Ancient Forest, Wildspire Waste, Coral Highlands.', 10, 15),
    (544, 'Erva de Neve', 2, 11, 'Material', 'Erva de neve encontrada em várias regiões.', 20, 30),
    (545, 'Teia de Aranha', 1, 11, 'Material', 'Teia de aranha encontrada em cavernas em vários mapas.', 10, 15),
    (546, 'Minério de Espírito', 6, 11, 'Material', 'Minério obtido de minérios azuis em Wildspire Spine (Sector ??).', 60, 90),
    (547, 'Ovo de Aço', 4, 11, 'Material', 'Ovo de aço obtido em missões ou expedições.', 40, 60),
    (548, 'Osso Resistente', 4, 11, 'Material', 'Osso resistente obtido de pilhas de ossos na Vale Pestilenta, Coral Highlands.', 40, 60),
    (549, 'Escama Sushi', 0, 11, 'Material', 'Escama obtida pescando Sushifish em vários mapas.', 10, 15),
    (550, 'Vale-Raider Voucher', 4, 11, 'Material', 'Ajude Lynians em toda a Nova Terra em Missões de Investigação para obter este voucher.', 40, 60),
    (551, 'Carapaça de Teostra', 6, 11, 'Material', 'Carapaça obtida de Teostra.', 60, 90),
    (552, 'Garra + de Teostra', 6, 11, 'Material', 'Garra aprimorada obtida de Teostra.', 60, 90),
    (553, 'Gema de Teostra', 0, 11, 'Material', 'Gema obtida de Teostra (??) .', 10, 15),
    (554, 'Chifre + de Teostra', 0, 11, 'Material', 'Chifre aprimorado obtido de Teostra (??) .', 10, 15),
    (555, 'Crina de Teostra', 0, 11, 'Material', 'Crina obtida de Teostra (??) .', 10, 15),
    (556, 'Pó de Teostra', 0, 11, 'Material', 'Pó obtido de Teostra.', 10, 15),
    (557, 'Cauda de Teostra', 0, 11, 'Material', 'Cauda obtida de Teostra.', 10, 15),
    (558, 'Teia de Teostra', 0, 11, 'Material', 'Teia obtida de Teostra.', 10, 15),
    (559, 'Casca Ébano Temperada', 10, 11, 'Material', 'Casca ébano temperada obtida de monstros temperados.', 100, 150),
    (560, 'Pelagem Cintilante Temperada', 11, 11, 'Material', 'Pelagem cintilante temperada obtida de monstros temperados.', 110, 165),
    (561, 'Concha Emborrachada Temperada', 9, 11, 'Material', 'Concha emborrachada temperada obtida de monstros temperados.', 90, 135),
    (562, 'Espinho', 0, 11, 'Material', 'Espinho utilizado como munição.', 10, 15),
    (563, 'Saco do Trovão', 4, 11, 'Material', 'Saco obtido de Tobi-Kadachi.', 40, 60),
    (564, 'Inseto Trovão', 4, 11, 'Material', 'Inseto trovão encontrado em Ancient Forest, Wildspire Waste, Coral Highlands, Rotten Vale, missões.', 40, 60),
    (565, 'Cogumelo', 6, 11, 'Material', 'Cogumelo encontrado em Ancient Forest, Wildspire Waste, Coral Highlands, Rotten Vale, Elder''s Recess, missões.', 60, 90),
    (566, 'Garra de Tobi-Kadachi', 4, 11, 'Material', 'Garra obtida de Tobi-Kadachi (Forelimbs) .', 40, 60),
    (567, 'Garra + de Tobi-Kadachi', 6, 11, 'Material', 'Garra aprimorada obtida de Tobi-Kadachi.', 60, 90),
    (568, 'Eletrodo de Tobi-Kadachi', 4, 11, 'Material', 'Eletrodo obtido de Tobi-Kadachi (Head) .', 40, 60),
    (569, 'Eletrodo + de Tobi-Kadachi', 6, 11, 'Material', 'Eletrodo aprimorado obtido de Tobi-Kadachi.', 60, 90),
    (570, 'Membrana de Tobi-Kadachi', 4, 11, 'Material', 'Membrana obtida de Tobi-Kadachi (Body) .', 40, 60),
    (571, 'Pele de Tobi-Kadachi', 4, 11, 'Material', 'Pele obtida de Tobi-Kadachi (??) .', 40, 60),
    (572, 'Pele + de Tobi-Kadachi', 6, 11, 'Material', 'Pele aprimorada obtida de Tobi-Kadachi.', 60, 90),
    (573, 'Escama de Tobi-Kadachi', 4, 11, 'Material', 'Escama obtida de Tobi-Kadachi (Body) .', 40, 60),
    (574, 'Escama + de Tobi-Kadachi', 6, 11, 'Material', 'Escama aprimorada obtida de Tobi-Kadachi.', 60, 90),
    (575, 'Saco de Torrente', 6, 11, 'Material', 'Saco obtido de Jyuratodus.', 60, 90),
    (576, 'Saco de Toxina', 6, 11, 'Material', 'Saco obtido de Pukei-Pukei.', 60, 90),
    (577, 'Tocha', 0, 11, 'Material', 'Tocha usada para iluminar o caminho.', 10, 15),
    (578, 'Chifre Retorcido', 4, 11, 'Material', 'Chifre obtido de Diablos.', 40, 60),
    (579, 'Presas do Crepúsculo', 11, 11, 'Material', 'Presas obtidas de monstros em regiões noturnas.', 110, 165),
    (580, 'Moeda Tzitzi', 4, 11, 'Material', 'Moeda obtida em missões de arena envolvendo Tzitzi-Ya-Ku.', 40, 60),
    (581, 'Garra de Tzitzi-Ya-Ku', 4, 11, 'Material', 'Garra obtida de Tzitzi-Ya-Ku (Body) .', 40, 60),
    (582, 'Garra + de Tzitzi-Ya-Ku', 6, 11, 'Material', 'Garra aprimorada obtida de Tzitzi-Ya-Ku (Body) .', 60, 90),
    (583, 'Pele de Tzitzi-Ya-Ku', 4, 11, 'Material', 'Pele obtida de Tzitzi-Ya-Ku (Reward) .', 40, 60),
    (584, 'Pele + de Tzitzi-Ya-Ku', 6, 11, 'Material', 'Pele aprimorada obtida de Tzitzi-Ya-Ku (Reward) .', 60, 90),
    (585, 'Fotóforo de Tzitzi-Ya-Ku', 4, 11, 'Material', 'Fotóforo obtido de Tzitzi-Ya-Ku (Break Pulse Organ) .', 40, 60),
    (586, 'Fotóforo + de Tzitzi-Ya-Ku', 6, 11, 'Material', 'Fotóforo aprimorado obtido de Tzitzi-Ya-Ku (Break Pulse Organ) .', 60, 90),
    (587, 'Escama de Tzitzi-Ya-Ku', 4, 11, 'Material', 'Escama obtida de Tzitzi-Ya-Ku (Body) .', 40, 60),
    (588, 'Escama + de Tzitzi-Ya-Ku', 6, 11, 'Material', 'Escama aprimorada obtida de Tzitzi-Ya-Ku (Body) .', 60, 90),
    (589, 'Crânio Desconhecido', 7, 11, 'Material', 'Crânio desconhecido obtido em pilhas de ossos na Elder''s Recess.', 70, 105),
    (590, 'Carapaça de Uragaan', 6, 11, 'Material', 'Carapaça obtida de Uragaan.', 60, 90),
    (591, 'Córtex de Uragaan', 10, 11, 'Material', 'Córtex obtido de Uragaan.', 100, 150),
    (592, 'Mandíbula de Uragaan', 6, 11, 'Material', 'Mandíbula obtida de Uragaan.', 60, 90),
    (593, 'Medula de Uragaan', 6, 11, 'Material', 'Medula obtida de Uragaan.', 60, 90),
    (594, 'Rubi de Uragaan', 0, 11, 'Material', 'Rubi obtido de Uragaan.', 10, 15),
    (595, 'Escama + de Uragaan', 6, 11, 'Material', 'Escama aprimorada obtida de Uragaan.', 60, 90),
    (596, 'Placa de Uragaan', 6, 11, 'Material', 'Placa obtida de Uragaan (carving severed tail).', 60, 90),
    (597, 'Carapaça de Vaal Hazak', 6, 11, 'Material', 'Carapaça obtida de Vaal Hazak.', 60, 90),
    (598, 'Presas + de Vaal Hazak', 6, 11, 'Material', 'Presas aprimoradas obtidas de Vaal Hazak.', 60, 90),
    (599, 'Gema de Vaal Hazak', 0, 11, 'Material', 'Gema obtida de Vaal Hazak.', 10, 15),
    (600, 'Membrana de Vaal Hazak', 0, 11, 'Material', 'Membrana obtida de Vaal Hazak.', 10, 15),
    (601, 'Cauda de Vaal Hazak', 0, 11, 'Material', 'Cauda obtida de Vaal Hazak.', 10, 15),
    (602, 'Garra de Vaal Hazak', 0, 11, 'Material', 'Garra obtida de Vaal Hazak.', 10, 15),
    (603, 'Asa de Vaal Hazak', 0, 11, 'Material', 'Asa obtida de Vaal Hazak.', 10, 15),
    (604, 'Quartzo de Val Habar', 0, 11, 'Material', 'Quartzo obtido em lojas de mercadores.', 10, 15),
    (605, 'Carapaça de Vespoid', 6, 11, 'Material', 'Carapaça obtida de Vespoid.', 60, 90),
    (606, 'Asa Interna de Vespoid', 6, 11, 'Material', 'Asa interna obtida de Vespoid.', 60, 90),
    (607, 'Carapaça de Vespoid', 4, 11, 'Material', 'Carapaça obtida de Vespoid (Body) .', 40, 60),
    (608, 'Asa de Vespoid', 4, 11, 'Material', 'Asa obtida de Vespoid (Body) .', 40, 60),
    (609, 'Valete', 4, 11, 'Material', 'Moeda obtida cumprimentando os glutões.', 40, 60),
    (610, 'Osso Vulcânico', 9, 11, 'Material', 'Osso obtido em pilhas de ossos no Elder''s Recess.', 90, 135),
    (611, 'Pele Quente', 4, 11, 'Material', 'Pele obtida de Kelbi (Body) .', 40, 60),
    (612, 'Osso Distorcido', 4, 11, 'Material', 'Osso obtido em pilhas de ossos no Rotten Vale.', 40, 60),
    (613, 'Pedra do Guerreiro: Espada', 7, 11, 'Material', 'Pedra do guerreiro para aprimorar espadas em monstros temperados.', 70, 105),
    (614, 'Pedra do Guerreiro: Lâmina', 7, 11, 'Material', 'Pedra do guerreiro para aprimorar lâminas em monstros temperados.', 70, 105),
    (615, 'Pedra do Guerreiro: Martelo', 7, 11, 'Material', 'Pedra do guerreiro para aprimorar martelos em monstros temperados.', 70, 105),
    (616, 'Pedra do Guerreiro: Lança', 7, 11, 'Material', 'Pedra do guerreiro para aprimorar lanças em monstros temperados.', 70, 105),
    (617, 'Pedra do Guerreiro: Machado', 7, 11, 'Material', 'Pedra do guerreiro para aprimorar machados em monstros temperados.', 70, 105),
    (618, 'Pedra do Guerreiro: Eixo', 7, 11, 'Material', 'Pedra do guerreiro para aprimorar eixos em monstros temperados.', 70, 105),
    (619, 'Pedra do Guerreiro: Distância', 7, 11, 'Material', 'Pedra do guerreiro para aprimorar armas à distância em monstros temperados.', 70, 105),
    (620, 'Barbatana de Whetfish', 0, 11, 'Material', 'Barbatana obtida de Great Whetfish (pesca).', 10, 15),
    (621, 'Barbatana + de Whetfish', 4, 11, 'Material', 'Barbatana aprimorada obtida de Great Whetfish (pesca).', 40, 60),
    (622, 'Fígado Branco', 0, 11, 'Material', 'Fígado obtido de Kelbi.', 10, 15),
    (623, 'Pele de Wingdrake', 4, 11, 'Material', 'Pele obtida de Noios (Body) .', 40, 60),
    (624, 'Pele + de Wingdrake', 6, 11, 'Material', 'Pele aprimorada obtida de Noios.', 60, 90),
    (625, 'Osso de Wyvern', 4, 11, 'Material', 'Osso obtido de Radobaan (R Drop) .', 40, 60),
    (626, 'Ovo de Wyvern', 0, 11, 'Material', 'Ovo obtido na Ancient Forest e Wildspire Waste.', 10, 15),
    (627, 'Gema de Wyvern', 7, 11, 'Material', 'Gema obtida de Barroth, Diablos, Radobbaan, Tobi-Kadachi, Jyuratodus, Lavasioth, Paolumu (Raro).', 70, 105),
    (628, 'Lágrima de Wyvern', 0, 11, 'Material', 'Lágrima obtida de monstros.', 10, 15),
    (629, 'Garra de Xenojiiva', 0, 11, 'Material', 'Garra obtida de Xenojiiva.', 10, 15),
    (630, 'Gema de Xenojiiva', 8, 11, 'Material', 'Gema rara obtida de Xenojiiva ', 80, 120),
    (631, 'Chifre de Xenojiiva', 0, 11, 'Material', 'Chifre obtido de Xenojiiva ', 10, 15),
    (632, 'Carapaça de Xenojiiva', 0, 11, 'Material', 'Carapaça obtida de Xenojiiva ', 10, 15),
    (633, 'Escama de Xenojiiva', 0, 11, 'Material', 'Escama obtida de Xenojiiva ', 10, 15),
    (634, 'Escama de Xenojiiva', 7, 11, 'Material', 'Escama aprimorada obtida de Xenojiiva ', 70, 105),
    (635, 'Veil de Xenojiiva', 7, 11, 'Material', 'Veil obtido de Xenojiiva ', 70, 105),
    (636, 'Asa de Xenojiiva', 0, 11, 'Material', 'Asa obtida de Xenojiiva ', 10, 15),
    (637, 'Carapaça de Zorah Magdaros', 6, 11, 'Material', 'Carapaça obtida de Zorah Magdaros (R drop ou mineração) ', 60, 90),
    (638, 'Gema de Zorah Magdaros', 7, 11, 'Material', 'Gema obtida de Zorah Magdaros (R recompensa) ', 70, 105),
    (639, 'Escala de Calor de Zorah Magdaros', 6, 11, 'Material', 'Escala obtida de Zorah Magdaros (Recompensa) ', 60, 90),
    (640, 'Magma de Zorah Magdaros', 6, 11, 'Material', 'Magma obtido de Zorah Magdaros (Break Head) ', 60, 90),
    (641, 'Pleura de Zorah Magdaros', 6, 11, 'Material', 'Pleura obtida de Zorah Magdaros (Break Chest) ', 60, 90);

-- Dropa item

INSERT INTO DropaItem (Monstro, Item, Chance)
VALUES
    (1, 119, 0.7),
    (1, 137, 0.15),
    (1, 207, 0.05),
    (1, 217, 0.15),
    (1, 243, 0.001),
    (1, 311, 0.05),
    (1, 403, 0.15),
    (1, 404, 0.15),
    (1, 405, 0.15),
    (1, 406, 0.15),
    (1, 409, 0.05),
    (1, 410, 0.05),
    (1, 610, 0.01),
    (1, 612, 0.15);

INSERT INTO DropaItem (Monstro, Item, Chance)
VALUES
    (2, 119, 0.7),
    (2, 137, 0.15),
    (2, 207, 0.05),
    (2, 217, 0.15),
    (2, 243, 0.001),
    (2, 311, 0.05),
    (2, 403, 0.15),
    (2, 404, 0.15),
    (2, 405, 0.15),
    (2, 406, 0.15),
    (2, 409, 0.05),
    (2, 410, 0.05),
    (2, 610, 0.01),
    (2, 612, 0.15);

INSERT INTO DropaItem (Monstro, Item, Chance)
VALUES
    (3, 119, 0.7),
    (3, 137, 0.15),
    (3, 207, 0.05),
    (3, 217, 0.15),
    (3, 243, 0.001),
    (3, 311, 0.05),
    (3, 403, 0.15),
    (3, 404, 0.15),
    (3, 405, 0.15),
    (3, 406, 0.15),
    (3, 409, 0.05),
    (3, 410, 0.05),
    (3, 610, 0.01),
    (3, 612, 0.15);

INSERT INTO DropaItem (Monstro, Item, Chance)
VALUES
    (4, 119, 0.7),
    (4, 137, 0.15),
    (4, 207, 0.05),
    (4, 217, 0.15),
    (4, 243, 0.001),
    (4, 311, 0.05),
    (4, 403, 0.15),
    (4, 404, 0.15),
    (4, 405, 0.15),
    (4, 406, 0.15),
    (4, 409, 0.05),
    (4, 410, 0.05),
    (4, 610, 0.01),
    (4, 612, 0.15);

INSERT INTO DropaItem (Monstro, Item, Chance)
VALUES
    (5, 119, 0.7),
    (5, 137, 0.15),
    (5, 207, 0.05),
    (5, 217, 0.15),
    (5, 243, 0.001),
    (5, 311, 0.05),
    (5, 403, 0.15),
    (5, 404, 0.15),
    (5, 405, 0.15),
    (5, 406, 0.15),
    (5, 409, 0.05),
    (5, 410, 0.05),
    (5, 610, 0.01),
    (5, 612, 0.15);

INSERT INTO DropaItem (Monstro, Item, Chance)
VALUES
    (6, 119, 0.7),
    (6, 137, 0.15),
    (6, 207, 0.05),
    (6, 217, 0.15),
    (6, 243, 0.001),
    (6, 311, 0.05),
    (6, 403, 0.15),
    (6, 404, 0.15),
    (6, 405, 0.15),
    (6, 406, 0.15),
    (6, 409, 0.05),
    (6, 410, 0.05),
    (6, 610, 0.01),
    (6, 612, 0.15);

INSERT INTO DropaItem (Monstro, Item, Chance)
VALUES
    (7, 119, 0.7),
    (7, 137, 0.15),
    (7, 207, 0.05),
    (7, 217, 0.15),
    (7, 243, 0.001),
    (7, 311, 0.05),
    (7, 403, 0.15),
    (7, 404, 0.15),
    (7, 405, 0.15),
    (7, 406, 0.15),
    (7, 409, 0.05),
    (7, 410, 0.05),
    (7, 610, 0.01),
    (7, 612, 0.15);

INSERT INTO DropaItem (Monstro, Item, Chance)
VALUES
    (8, 119, 0.7),
    (8, 137, 0.15),
    (8, 207, 0.05),
    (8, 217, 0.15),
    (8, 243, 0.001),
    (8, 311, 0.05),
    (8, 403, 0.15),
    (8, 404, 0.15),
    (8, 405, 0.15),
    (8, 406, 0.15),
    (8, 409, 0.05),
    (8, 410, 0.05),
    (8, 610, 0.01),
    (8, 612, 0.15);

INSERT INTO DropaItem (Monstro, Item, Chance)
VALUES
    (9, 119, 0.7),
    (9, 137, 0.15),
    (9, 207, 0.05),
    (9, 217, 0.15),
    (9, 243, 0.001),
    (9, 311, 0.05),
    (9, 403, 0.15),
    (9, 404, 0.15),
    (9, 405, 0.15),
    (9, 406, 0.15),
    (9, 409, 0.05),
    (9, 410, 0.05),
    (9, 610, 0.01),
    (9, 612, 0.15);

INSERT INTO DropaItem (Monstro, Item, Chance)
VALUES
    (10, 119, 0.7),
    (10, 137, 0.15),
    (10, 207, 0.05),
    (10, 217, 0.15),
    (10, 243, 0.001),
    (10, 311, 0.05),
    (10, 403, 0.15),
    (10, 404, 0.15),
    (10, 405, 0.15),
    (10, 406, 0.15),
    (10, 409, 0.05),
    (10, 410, 0.05),
    (10, 610, 0.01),
    (10, 612, 0.15);

INSERT INTO DropaItem (Monstro, Item, Chance)
VALUES
    (11, 119, 0.7),
    (11, 137, 0.15),
    (11, 207, 0.05),
    (11, 217, 0.15),
    (11, 243, 0.001),
    (11, 311, 0.05),
    (11, 403, 0.15),
    (11, 404, 0.15),
    (11, 405, 0.15),
    (11, 406, 0.15),
    (11, 409, 0.05),
    (11, 410, 0.05),
    (11, 610, 0.01),
    (11, 612, 0.15);

INSERT INTO DropaItem (Monstro, Item, Chance)
VALUES
    (12, 119, 0.7),
    (12, 137, 0.15),
    (12, 207, 0.05),
    (12, 217, 0.15),
    (12, 243, 0.001),
    (12, 311, 0.05),
    (12, 403, 0.15),
    (12, 404, 0.15),
    (12, 405, 0.15),
    (12, 406, 0.15),
    (12, 409, 0.05),
    (12, 410, 0.05),
    (12, 610, 0.01),
    (12, 612, 0.15);

INSERT INTO DropaItem (Monstro, Item, Chance)
VALUES
    (13, 119, 0.7),
    (13, 137, 0.15),
    (13, 207, 0.05),
    (13, 217, 0.15),
    (13, 243, 0.001),
    (13, 311, 0.05),
    (13, 403, 0.15),
    (13, 404, 0.15),
    (13, 405, 0.15),
    (13, 406, 0.15),
    (13, 409, 0.05),
    (13, 410, 0.05),
    (13, 610, 0.01),
    (13, 612, 0.15);

INSERT INTO DropaItem (Monstro, Item, Chance)
VALUES
    (14, 119, 0.7),
    (14, 137, 0.15),
    (14, 207, 0.05),
    (14, 217, 0.15),
    (14, 243, 0.001),
    (14, 311, 0.05),
    (14, 403, 0.15),
    (14, 404, 0.15),
    (14, 405, 0.15),
    (14, 406, 0.15),
    (14, 409, 0.05),
    (14, 410, 0.05),
    (14, 610, 0.01),
    (14, 612, 0.15);

INSERT INTO DropaItem (Monstro, Item, Chance)
VALUES
    (15, 119, 0.7),
    (15, 137, 0.15),
    (15, 207, 0.05),
    (15, 217, 0.15),
    (15, 243, 0.001),
    (15, 311, 0.05),
    (15, 403, 0.15),
    (15, 404, 0.15),
    (15, 405, 0.15),
    (15, 406, 0.15),
    (15, 409, 0.05),
    (15, 410, 0.05),
    (15, 610, 0.01),
    (15, 612, 0.15);

INSERT INTO DropaItem (Monstro, Item, Chance)
VALUES
    (16, 119, 0.7),
    (16, 137, 0.15),
    (16, 207, 0.05),
    (16, 217, 0.15),
    (16, 243, 0.001),
    (16, 311, 0.05),
    (16, 403, 0.15),
    (16, 404, 0.15),
    (16, 405, 0.15),
    (16, 406, 0.15),
    (16, 409, 0.05),
    (16, 410, 0.05),
    (16, 610, 0.01),
    (16, 612, 0.15);

INSERT INTO DropaItem (Monstro, Item, Chance)
VALUES
    (17, 119, 0.7),
    (17, 137, 0.15),
    (17, 207, 0.05),
    (17, 217, 0.15),
    (17, 243, 0.001),
    (17, 311, 0.05),
    (17, 403, 0.15),
    (17, 404, 0.15),
    (17, 405, 0.15),
    (17, 406, 0.15),
    (17, 409, 0.05),
    (17, 410, 0.05),
    (17, 610, 0.01),
    (17, 612, 0.15);

INSERT INTO DropaItem (Monstro, Item, Chance)
VALUES
    (18, 119, 0.7),
    (18, 137, 0.15),
    (18, 207, 0.05),
    (18, 217, 0.15),
    (18, 243, 0.001),
    (18, 311, 0.05),
    (18, 403, 0.15),
    (18, 404, 0.15),
    (18, 405, 0.15),
    (18, 406, 0.15),
    (18, 409, 0.05),
    (18, 410, 0.05),
    (18, 610, 0.01),
    (18, 612, 0.15);

INSERT INTO DropaItem (Monstro, Item, Chance)
VALUES
    (19, 119, 0.7),
    (19, 137, 0.15),
    (19, 207, 0.05),
    (19, 217, 0.15),
    (19, 243, 0.001),
    (19, 311, 0.05),
    (19, 403, 0.15),
    (19, 404, 0.15),
    (19, 405, 0.15),
    (19, 406, 0.15),
    (19, 409, 0.05),
    (19, 410, 0.05),
    (19, 610, 0.01),
    (19, 612, 0.15);

INSERT INTO DropaItem (Monstro, Item, Chance)
VALUES
    (20, 119, 0.7),
    (20, 137, 0.15),
    (20, 207, 0.05),
    (20, 217, 0.15),
    (20, 243, 0.001),
    (20, 311, 0.05),
    (20, 403, 0.15),
    (20, 404, 0.15),
    (20, 405, 0.15),
    (20, 406, 0.15),
    (20, 409, 0.05),
    (20, 410, 0.05),
    (20, 610, 0.01),
    (20, 612, 0.15);

INSERT INTO DropaItem (Monstro, Item, Chance)
VALUES
    (21, 119, 0.7),
    (21, 137, 0.15),
    (21, 207, 0.05),
    (21, 217, 0.15),
    (21, 243, 0.001),
    (21, 311, 0.05),
    (21, 403, 0.15),
    (21, 404, 0.15),
    (21, 405, 0.15),
    (21, 406, 0.15),
    (21, 409, 0.05),
    (21, 410, 0.05),
    (21, 610, 0.01),
    (21, 612, 0.15);

INSERT INTO DropaItem (Monstro, Item, Chance)
VALUES
    (22, 119, 0.7),
    (22, 137, 0.15),
    (22, 207, 0.05),
    (22, 217, 0.15),
    (22, 243, 0.001),
    (22, 311, 0.05),
    (22, 403, 0.15),
    (22, 404, 0.15),
    (22, 405, 0.15),
    (22, 406, 0.15),
    (22, 409, 0.05),
    (22, 410, 0.05),
    (22, 610, 0.01),
    (22, 612, 0.15);

INSERT INTO DropaItem (Monstro, Item, Chance)
VALUES
    (23, 119, 0.7),
    (23, 137, 0.15),
    (23, 207, 0.05),
    (23, 217, 0.15),
    (23, 243, 0.001),
    (23, 311, 0.05),
    (23, 403, 0.15),
    (23, 404, 0.15),
    (23, 405, 0.15),
    (23, 406, 0.15),
    (23, 409, 0.05),
    (23, 410, 0.05),
    (23, 610, 0.01),
    (23, 612, 0.15);

INSERT INTO DropaItem (Monstro, Item, Chance)
VALUES
    (24, 119, 0.7),
    (24, 137, 0.15),
    (24, 207, 0.05),
    (24, 217, 0.15),
    (24, 243, 0.001),
    (24, 311, 0.05),
    (24, 403, 0.15),
    (24, 404, 0.15),
    (24, 405, 0.15),
    (24, 406, 0.15),
    (24, 409, 0.05),
    (24, 410, 0.05),
    (24, 610, 0.01),
    (24, 612, 0.15);

INSERT INTO DropaItem (Monstro, Item, Chance)
VALUES
    (25, 119, 0.7),
    (25, 137, 0.15),
    (25, 207, 0.05),
    (25, 217, 0.15),
    (25, 243, 0.001),
    (25, 311, 0.05),
    (25, 403, 0.15),
    (25, 404, 0.15),
    (25, 405, 0.15),
    (25, 406, 0.15),
    (25, 409, 0.05),
    (25, 410, 0.05),
    (25, 610, 0.01),
    (25, 612, 0.15);

INSERT INTO DropaItem (Monstro, Item, Chance)
VALUES
    (26, 119, 0.7),
    (26, 137, 0.15),
    (26, 207, 0.05),
    (26, 217, 0.15),
    (26, 243, 0.001),
    (26, 311, 0.05),
    (26, 403, 0.15),
    (26, 404, 0.15),
    (26, 405, 0.15),
    (26, 406, 0.15),
    (26, 409, 0.05),
    (26, 410, 0.05),
    (26, 610, 0.01),
    (26, 612, 0.15);

INSERT INTO DropaItem (Monstro, Item, Chance)
VALUES
    (27, 119, 0.7),
    (27, 137, 0.15),
    (27, 207, 0.05),
    (27, 217, 0.15),
    (27, 243, 0.001),
    (27, 311, 0.05),
    (27, 403, 0.15),
    (27, 404, 0.15),
    (27, 405, 0.15),
    (27, 406, 0.15),
    (27, 409, 0.05),
    (27, 410, 0.05),
    (27, 610, 0.01),
    (27, 612, 0.15);

INSERT INTO DropaItem (Monstro, Item, Chance)
VALUES
    (28, 119, 0.7),
    (28, 137, 0.15),
    (28, 207, 0.05),
    (28, 217, 0.15),
    (28, 243, 0.001),
    (28, 311, 0.05),
    (28, 403, 0.15),
    (28, 404, 0.15),
    (28, 405, 0.15),
    (28, 406, 0.15),
    (28, 409, 0.05),
    (28, 410, 0.05),
    (28, 610, 0.01),
    (28, 612, 0.15);

INSERT INTO DropaItem (Monstro, Item, Chance)
VALUES
    (29, 119, 0.7),
    (29, 137, 0.15),
    (29, 207, 0.05),
    (29, 217, 0.15),
    (29, 243, 0.001),
    (29, 311, 0.05),
    (29, 403, 0.15),
    (29, 404, 0.15),
    (29, 405, 0.15),
    (29, 406, 0.15),
    (29, 409, 0.05),
    (29, 410, 0.05),
    (29, 610, 0.01),
    (29, 612, 0.15);

INSERT INTO DropaItem (Monstro, Item, Chance)
VALUES
    (30, 119, 0.7),
    (30, 137, 0.15),
    (30, 207, 0.05),
    (30, 217, 0.15),
    (30, 243, 0.001),
    (30, 311, 0.05),
    (30, 403, 0.15),
    (30, 404, 0.15),
    (30, 405, 0.15),
    (30, 406, 0.15),
    (30, 409, 0.05),
    (30, 410, 0.05),
    (30, 610, 0.01),
    (30, 612, 0.15);

INSERT INTO DropaItem (Monstro, Item, Chance)
VALUES
    (31, 119, 0.7),
    (31, 137, 0.15),
    (31, 207, 0.05),
    (31, 217, 0.15),
    (31, 243, 0.001),
    (31, 311, 0.05),
    (31, 403, 0.15),
    (31, 404, 0.15),
    (31, 405, 0.15),
    (31, 406, 0.15),
    (31, 409, 0.05),
    (31, 410, 0.05),
    (31, 610, 0.01),
    (31, 612, 0.15);

INSERT INTO DropaItem (Monstro, Item, Chance)
VALUES
    (32, 119, 0.7),
    (32, 137, 0.15),
    (32, 207, 0.05),
    (32, 217, 0.15),
    (32, 243, 0.001),
    (32, 311, 0.05),
    (32, 403, 0.15),
    (32, 404, 0.15),
    (32, 405, 0.15),
    (32, 406, 0.15),
    (32, 409, 0.05),
    (32, 410, 0.05),
    (32, 610, 0.01),
    (32, 612, 0.15);

INSERT INTO DropaItem (Monstro, Item, Chance)
VALUES
    (33, 119, 0.7),
    (33, 137, 0.15),
    (33, 207, 0.05),
    (33, 217, 0.15),
    (33, 243, 0.001),
    (33, 311, 0.05),
    (33, 403, 0.15),
    (33, 404, 0.15),
    (33, 405, 0.15),
    (33, 406, 0.15),
    (33, 409, 0.05),
    (33, 410, 0.05),
    (33, 610, 0.01),
    (33, 612, 0.15);

INSERT INTO DropaItem (Monstro, Item, Chance)
VALUES
    (34, 119, 0.7),
    (34, 137, 0.15),
    (34, 207, 0.05),
    (34, 217, 0.15),
    (34, 243, 0.001),
    (34, 311, 0.05),
    (34, 403, 0.15),
    (34, 404, 0.15),
    (34, 405, 0.15),
    (34, 406, 0.15),
    (34, 409, 0.05),
    (34, 410, 0.05),
    (34, 610, 0.01),
    (34, 612, 0.15);

INSERT INTO DropaItem (Monstro, Item, Chance)
VALUES
    (35, 119, 0.7),
    (35, 137, 0.15),
    (35, 207, 0.05),
    (35, 217, 0.15),
    (35, 243, 0.001),
    (35, 311, 0.05),
    (35, 403, 0.15),
    (35, 404, 0.15),
    (35, 405, 0.15),
    (35, 406, 0.15),
    (35, 409, 0.05),
    (35, 410, 0.05),
    (35, 610, 0.01),
    (35, 612, 0.15);

INSERT INTO DropaItem (Monstro, Item, Chance)
VALUES
    (36, 119, 0.7),
    (36, 137, 0.15),
    (36, 207, 0.05),
    (36, 217, 0.15),
    (36, 243, 0.001),
    (36, 311, 0.05),
    (36, 403, 0.15),
    (36, 404, 0.15),
    (36, 405, 0.15),
    (36, 406, 0.15),
    (36, 409, 0.05),
    (36, 410, 0.05),
    (36, 610, 0.01),
    (36, 612, 0.15);

INSERT INTO DropaItem (Monstro, Item, Chance)
VALUES
    (37, 119, 0.7),
    (37, 137, 0.15),
    (37, 207, 0.05),
    (37, 217, 0.15),
    (37, 243, 0.001),
    (37, 311, 0.05),
    (37, 403, 0.15),
    (37, 404, 0.15),
    (37, 405, 0.15),
    (37, 406, 0.15),
    (37, 409, 0.05),
    (37, 410, 0.05),
    (37, 610, 0.01),
    (37, 612, 0.15);

INSERT INTO DropaItem (Monstro, Item, Chance)
VALUES
    (38, 119, 0.7),
    (38, 137, 0.15),
    (38, 207, 0.05),
    (38, 217, 0.15),
    (38, 243, 0.001),
    (38, 311, 0.05),
    (38, 403, 0.15),
    (38, 404, 0.15),
    (38, 405, 0.15),
    (38, 406, 0.15),
    (38, 409, 0.05),
    (38, 410, 0.05),
    (38, 610, 0.01),
    (38, 612, 0.15);

INSERT INTO DropaItem (Monstro, Item, Chance)
VALUES
    (39, 119, 0.7),
    (39, 137, 0.15),
    (39, 207, 0.05),
    (39, 217, 0.15),
    (39, 243, 0.001),
    (39, 311, 0.05),
    (39, 403, 0.15),
    (39, 404, 0.15),
    (39, 405, 0.15),
    (39, 406, 0.15),
    (39, 409, 0.05),
    (39, 410, 0.05),
    (39, 610, 0.01),
    (39, 612, 0.15);

INSERT INTO DropaItem (Monstro, Item, Chance)
VALUES
    (40, 119, 0.7),
    (40, 137, 0.15),
    (40, 207, 0.05),
    (40, 217, 0.15),
    (40, 243, 0.001),
    (40, 311, 0.05),
    (40, 403, 0.15),
    (40, 404, 0.15),
    (40, 405, 0.15),
    (40, 406, 0.15),
    (40, 409, 0.05),
    (40, 410, 0.05),
    (40, 610, 0.01),
    (40, 612, 0.15);

INSERT INTO DropaItem (Monstro, Item, Chance)
VALUES
    (41, 119, 0.7),
    (41, 137, 0.15),
    (41, 207, 0.05),
    (41, 217, 0.15),
    (41, 243, 0.001),
    (41, 311, 0.05),
    (41, 403, 0.15),
    (41, 404, 0.15),
    (41, 405, 0.15),
    (41, 406, 0.15),
    (41, 409, 0.05),
    (41, 410, 0.05),
    (41, 610, 0.01),
    (41, 612, 0.15);

INSERT INTO DropaItem (Monstro, Item, Chance)
VALUES
    (42, 119, 0.7),
    (42, 137, 0.15),
    (42, 207, 0.05),
    (42, 217, 0.15),
    (42, 243, 0.001),
    (42, 311, 0.05),
    (42, 403, 0.15),
    (42, 404, 0.15),
    (42, 405, 0.15),
    (42, 406, 0.15),
    (42, 409, 0.05),
    (42, 410, 0.05),
    (42, 610, 0.01),
    (42, 612, 0.15);

INSERT INTO DropaItem (Monstro, Item, Chance)
VALUES
    (43, 119, 0.7),
    (43, 137, 0.15),
    (43, 207, 0.05),
    (43, 217, 0.15),
    (43, 243, 0.001),
    (43, 311, 0.05),
    (43, 403, 0.15),
    (43, 404, 0.15),
    (43, 405, 0.15),
    (43, 406, 0.15),
    (43, 409, 0.05),
    (43, 410, 0.05),
    (43, 610, 0.01),
    (43, 612, 0.15);

INSERT INTO DropaItem (Monstro, Item, Chance)
VALUES
    (44, 119, 0.7),
    (44, 137, 0.15),
    (44, 207, 0.05),
    (44, 217, 0.15),
    (44, 243, 0.001),
    (44, 311, 0.05),
    (44, 403, 0.15),
    (44, 404, 0.15),
    (44, 405, 0.15),
    (44, 406, 0.15),
    (44, 409, 0.05),
    (44, 410, 0.05),
    (44, 610, 0.01),
    (44, 612, 0.15);

INSERT INTO DropaItem (Monstro, Item, Chance)
VALUES
    (45, 119, 0.7),
    (45, 137, 0.15),
    (45, 207, 0.05),
    (45, 217, 0.15),
    (45, 243, 0.001),
    (45, 311, 0.05),
    (45, 403, 0.15),
    (45, 404, 0.15),
    (45, 405, 0.15),
    (45, 406, 0.15),
    (45, 409, 0.05),
    (45, 410, 0.05),
    (45, 610, 0.01),
    (45, 612, 0.15);

INSERT INTO DropaItem (Monstro, Item, Chance)
VALUES
    (46, 119, 0.7),
    (46, 137, 0.15),
    (46, 207, 0.05),
    (46, 217, 0.15),
    (46, 243, 0.001),
    (46, 311, 0.05),
    (46, 403, 0.15),
    (46, 404, 0.15),
    (46, 405, 0.15),
    (46, 406, 0.15),
    (46, 409, 0.05),
    (46, 410, 0.05),
    (46, 610, 0.01),
    (46, 612, 0.15);

INSERT INTO DropaItem (Monstro, Item, Chance)
VALUES
    (47, 119, 0.7),
    (47, 137, 0.15),
    (47, 207, 0.05),
    (47, 217, 0.15),
    (47, 243, 0.001),
    (47, 311, 0.05),
    (47, 403, 0.15),
    (47, 404, 0.15),
    (47, 405, 0.15),
    (47, 406, 0.15),
    (47, 409, 0.05),
    (47, 410, 0.05),
    (47, 610, 0.01),
    (47, 612, 0.15);

INSERT INTO DropaItem (Monstro, Item, Chance)
VALUES
    (48, 119, 0.7),
    (48, 137, 0.15),
    (48, 207, 0.05),
    (48, 217, 0.15),
    (48, 243, 0.001),
    (48, 311, 0.05),
    (48, 403, 0.15),
    (48, 404, 0.15),
    (48, 405, 0.15),
    (48, 406, 0.15),
    (48, 409, 0.05),
    (48, 410, 0.05),
    (48, 610, 0.01),
    (48, 612, 0.15);

INSERT INTO DropaItem (Monstro, Item, Chance)
VALUES
    (49, 119, 0.7),
    (49, 137, 0.15),
    (49, 207, 0.05),
    (49, 217, 0.15),
    (49, 243, 0.001),
    (49, 311, 0.05),
    (49, 403, 0.15),
    (49, 404, 0.15),
    (49, 405, 0.15),
    (49, 406, 0.15),
    (49, 409, 0.05),
    (49, 410, 0.05),
    (49, 610, 0.01),
    (49, 612, 0.15);

INSERT INTO DropaItem (Monstro, Item, Chance)
VALUES
    (50, 119, 0.7),
    (50, 137, 0.15),
    (50, 207, 0.05),
    (50, 217, 0.15),
    (50, 243, 0.001),
    (50, 311, 0.05),
    (50, 403, 0.15),
    (50, 404, 0.15),
    (50, 405, 0.15),
    (50, 406, 0.15),
    (50, 409, 0.05),
    (50, 410, 0.05),
    (50, 610, 0.01),
    (50, 612, 0.15);

INSERT INTO DropaItem (Monstro, Item, Chance)
VALUES
    (51, 119, 0.7),
    (51, 137, 0.15),
    (51, 207, 0.05),
    (51, 217, 0.15),
    (51, 243, 0.001),
    (51, 311, 0.05),
    (51, 403, 0.15),
    (51, 404, 0.15),
    (51, 405, 0.15),
    (51, 406, 0.15),
    (51, 409, 0.05),
    (51, 410, 0.05),
    (51, 610, 0.01),
    (51, 612, 0.15);

INSERT INTO DropaItem (Monstro, Item, Chance)
VALUES
    (52, 119, 0.7),
    (52, 137, 0.15),
    (52, 207, 0.05),
    (52, 217, 0.15),
    (52, 243, 0.001),
    (52, 311, 0.05),
    (52, 403, 0.15),
    (52, 404, 0.15),
    (52, 405, 0.15),
    (52, 406, 0.15),
    (52, 409, 0.05),
    (52, 410, 0.05),
    (52, 610, 0.01),
    (52, 612, 0.15);

INSERT INTO DropaItem (Monstro, Item, Chance)
VALUES
    (53, 119, 0.7),
    (53, 137, 0.15),
    (53, 207, 0.05),
    (53, 217, 0.15),
    (53, 243, 0.001),
    (53, 311, 0.05),
    (53, 403, 0.15),
    (53, 404, 0.15),
    (53, 405, 0.15),
    (53, 406, 0.15),
    (53, 409, 0.05),
    (53, 410, 0.05),
    (53, 610, 0.01),
    (53, 612, 0.15);

INSERT INTO DropaItem (Monstro, Item, Chance)
VALUES
    (54, 119, 0.7),
    (54, 137, 0.15),
    (54, 207, 0.05),
    (54, 217, 0.15),
    (54, 243, 0.001),
    (54, 311, 0.05),
    (54, 403, 0.15),
    (54, 404, 0.15),
    (54, 405, 0.15),
    (54, 406, 0.15),
    (54, 409, 0.05),
    (54, 410, 0.05),
    (54, 610, 0.01),
    (54, 612, 0.15);

INSERT INTO DropaItem (Monstro, Item, Chance)
VALUES
    (55, 119, 0.7),
    (55, 137, 0.15),
    (55, 207, 0.05),
    (55, 217, 0.15),
    (55, 243, 0.001),
    (55, 311, 0.05),
    (55, 403, 0.15),
    (55, 404, 0.15),
    (55, 405, 0.15),
    (55, 406, 0.15),
    (55, 409, 0.05),
    (55, 410, 0.05),
    (55, 610, 0.01),
    (55, 612, 0.15);

INSERT INTO DropaItem (Monstro, Item, Chance)
VALUES
    (56, 119, 0.7),
    (56, 137, 0.15),
    (56, 207, 0.05),
    (56, 217, 0.15),
    (56, 243, 0.001),
    (56, 311, 0.05),
    (56, 403, 0.15),
    (56, 404, 0.15),
    (56, 405, 0.15),
    (56, 406, 0.15),
    (56, 409, 0.05),
    (56, 410, 0.05),
    (56, 610, 0.01),
    (56, 612, 0.15);

INSERT INTO DropaItem (Monstro, Item, Chance)
VALUES
    (57, 119, 0.7),
    (57, 137, 0.15),
    (57, 207, 0.05),
    (57, 217, 0.15),
    (57, 243, 0.001),
    (57, 311, 0.05),
    (57, 403, 0.15),
    (57, 404, 0.15),
    (57, 405, 0.15),
    (57, 406, 0.15),
    (57, 409, 0.05),
    (57, 410, 0.05),
    (57, 610, 0.01),
    (57, 612, 0.15);

INSERT INTO DropaItem (Monstro, Item, Chance)
VALUES
    (58, 119, 0.7),
    (58, 137, 0.15),
    (58, 207, 0.05),
    (58, 217, 0.15),
    (58, 243, 0.001),
    (58, 311, 0.05),
    (58, 403, 0.15),
    (58, 404, 0.15),
    (58, 405, 0.15),
    (58, 406, 0.15),
    (58, 409, 0.05),
    (58, 410, 0.05),
    (58, 610, 0.01),
    (58, 612, 0.15);

INSERT INTO DropaItem (Monstro, Item, Chance)
VALUES
    (59, 119, 0.7),
    (59, 137, 0.15),
    (59, 207, 0.05),
    (59, 217, 0.15),
    (59, 243, 0.001),
    (59, 311, 0.05),
    (59, 403, 0.15),
    (59, 404, 0.15),
    (59, 405, 0.15),
    (59, 406, 0.15),
    (59, 409, 0.05),
    (59, 410, 0.05),
    (59, 610, 0.01),
    (59, 612, 0.15);

INSERT INTO DropaItem (Monstro, Item, Chance)
VALUES
    (60, 119, 0.7),
    (60, 137, 0.15),
    (60, 207, 0.05),
    (60, 217, 0.15),
    (60, 243, 0.001),
    (60, 311, 0.05),
    (60, 403, 0.15),
    (60, 404, 0.15),
    (60, 405, 0.15),
    (60, 406, 0.15),
    (60, 409, 0.05),
    (60, 410, 0.05),
    (60, 610, 0.01),
    (60, 612, 0.15);

INSERT INTO DropaItem (Monstro, Item, Chance)
VALUES
    (61, 119, 0.7),
    (61, 137, 0.15),
    (61, 207, 0.05),
    (61, 217, 0.15),
    (61, 243, 0.001),
    (61, 311, 0.05),
    (61, 403, 0.15),
    (61, 404, 0.15),
    (61, 405, 0.15),
    (61, 406, 0.15),
    (61, 409, 0.05),
    (61, 410, 0.05),
    (61, 610, 0.01),
    (61, 612, 0.15);

INSERT INTO DropaItem (Monstro, Item, Chance)
VALUES
    (62, 119, 0.7),
    (62, 137, 0.15),
    (62, 207, 0.05),
    (62, 217, 0.15),
    (62, 243, 0.001),
    (62, 311, 0.05),
    (62, 403, 0.15),
    (62, 404, 0.15),
    (62, 405, 0.15),
    (62, 406, 0.15),
    (62, 409, 0.05),
    (62, 410, 0.05),
    (62, 610, 0.01),
    (62, 612, 0.15);

INSERT INTO DropaItem (Monstro, Item, Chance)
VALUES
    (63, 119, 0.7),
    (63, 137, 0.15),
    (63, 207, 0.05),
    (63, 217, 0.15),
    (63, 243, 0.001),
    (63, 311, 0.05),
    (63, 403, 0.15),
    (63, 404, 0.15),
    (63, 405, 0.15),
    (63, 406, 0.15),
    (63, 409, 0.05),
    (63, 410, 0.05),
    (63, 610, 0.01),
    (63, 612, 0.15);

INSERT INTO DropaItem (Monstro, Item, Chance)
VALUES
    (64, 119, 0.7),
    (64, 137, 0.15),
    (64, 207, 0.05),
    (64, 217, 0.15),
    (64, 243, 0.001),
    (64, 311, 0.05),
    (64, 403, 0.15),
    (64, 404, 0.15),
    (64, 405, 0.15),
    (64, 406, 0.15),
    (64, 409, 0.05),
    (64, 410, 0.05),
    (64, 610, 0.01),
    (64, 612, 0.15);

INSERT INTO DropaItem (Monstro, Item, Chance)
VALUES
    (65, 119, 0.7),
    (65, 137, 0.15),
    (65, 207, 0.05),
    (65, 217, 0.15),
    (65, 243, 0.001),
    (65, 311, 0.05),
    (65, 403, 0.15),
    (65, 404, 0.15),
    (65, 405, 0.15),
    (65, 406, 0.15),
    (65, 409, 0.05),
    (65, 410, 0.05),
    (65, 610, 0.01),
    (65, 612, 0.15);

INSERT INTO DropaItem (Monstro, Item, Chance)
VALUES
    (66, 119, 0.7),
    (66, 137, 0.15),
    (66, 207, 0.05),
    (66, 217, 0.15),
    (66, 243, 0.001),
    (66, 311, 0.05),
    (66, 403, 0.15),
    (66, 404, 0.15),
    (66, 405, 0.15),
    (66, 406, 0.15),
    (66, 409, 0.05),
    (66, 410, 0.05),
    (66, 610, 0.01),
    (66, 612, 0.15);

INSERT INTO DropaItem (Monstro, Item, Chance)
VALUES
    (67, 119, 0.7),
    (67, 137, 0.15),
    (67, 207, 0.05),
    (67, 217, 0.15),
    (67, 243, 0.001),
    (67, 311, 0.05),
    (67, 403, 0.15),
    (67, 404, 0.15),
    (67, 405, 0.15),
    (67, 406, 0.15),
    (67, 409, 0.05),
    (67, 410, 0.05),
    (67, 610, 0.01),
    (67, 612, 0.15);

INSERT INTO DropaItem (Monstro, Item, Chance)
VALUES
    (68, 119, 0.7),
    (68, 137, 0.15),
    (68, 207, 0.05),
    (68, 217, 0.15),
    (68, 243, 0.001),
    (68, 311, 0.05),
    (68, 403, 0.15),
    (68, 404, 0.15),
    (68, 405, 0.15),
    (68, 406, 0.15),
    (68, 409, 0.05),
    (68, 410, 0.05),
    (68, 610, 0.01),
    (68, 612, 0.15);

INSERT INTO DropaItem (Monstro, Item, Chance)
VALUES
    (69, 119, 0.7),
    (69, 137, 0.15),
    (69, 207, 0.05),
    (69, 217, 0.15),
    (69, 243, 0.001),
    (69, 311, 0.05),
    (69, 403, 0.15),
    (69, 404, 0.15),
    (69, 405, 0.15),
    (69, 406, 0.15),
    (69, 409, 0.05),
    (69, 410, 0.05),
    (69, 610, 0.01),
    (69, 612, 0.15);

INSERT INTO DropaItem (Monstro, Item, Chance)
VALUES
    (70, 119, 0.7),
    (70, 137, 0.15),
    (70, 207, 0.05),
    (70, 217, 0.15),
    (70, 243, 0.001),
    (70, 311, 0.05),
    (70, 403, 0.15),
    (70, 404, 0.15),
    (70, 405, 0.15),
    (70, 406, 0.15),
    (70, 409, 0.05),
    (70, 410, 0.05),
    (70, 610, 0.01),
    (70, 612, 0.15);

INSERT INTO DropaItem (Monstro, Item, Chance)
VALUES
    (71, 119, 0.7),
    (71, 137, 0.15),
    (71, 207, 0.05),
    (71, 217, 0.15),
    (71, 243, 0.001),
    (71, 311, 0.05),
    (71, 403, 0.15),
    (71, 404, 0.15),
    (71, 405, 0.15),
    (71, 406, 0.15),
    (71, 409, 0.05),
    (71, 410, 0.05),
    (71, 610, 0.01),
    (71, 612, 0.15);

INSERT INTO DropaItem (Monstro, Item, Chance)
VALUES
    (72, 119, 0.7),
    (72, 137, 0.15),
    (72, 207, 0.05),
    (72, 217, 0.15),
    (72, 243, 0.001),
    (72, 311, 0.05),
    (72, 403, 0.15),
    (72, 404, 0.15),
    (72, 405, 0.15),
    (72, 406, 0.15),
    (72, 409, 0.05),
    (72, 410, 0.05),
    (72, 610, 0.01),
    (72, 612, 0.15);

INSERT INTO DropaItem (Monstro, Item, Chance)
VALUES
    (73, 119, 0.7),
    (73, 137, 0.15),
    (73, 207, 0.05),
    (73, 217, 0.15),
    (73, 243, 0.001),
    (73, 311, 0.05),
    (73, 403, 0.15),
    (73, 404, 0.15),
    (73, 405, 0.15),
    (73, 406, 0.15),
    (73, 409, 0.05),
    (73, 410, 0.05),
    (73, 610, 0.01),
    (73, 612, 0.15);

INSERT INTO DropaItem (Monstro, Item, Chance)
VALUES
    (74, 119, 0.7),
    (74, 137, 0.15),
    (74, 207, 0.05),
    (74, 217, 0.15),
    (74, 243, 0.001),
    (74, 311, 0.05),
    (74, 403, 0.15),
    (74, 404, 0.15),
    (74, 405, 0.15),
    (74, 406, 0.15),
    (74, 409, 0.05),
    (74, 410, 0.05),
    (74, 610, 0.01),
    (74, 612, 0.15);



INSERT INTO DropaItem (Monstro, Item, Chance)
    SELECT 
        m.IdMonstro,
        i.IdItem,
        (14.0 - i.Raridade) / 14.0 AS ChanceAquisicao
    FROM 
        Monstro m
    JOIN 
        Item i ON i.nome LIKE CONCAT('%', m.Nome, '%') OR i.descricao LIKE CONCAT('%', m.Nome, '%')
    GROUP BY 
        m.IdMonstro, i.IdItem, i.Nome, i.Raridade
    ORDER BY 
        m.IdMonstro;


-- MISSÕES

INSERT INTO Missao (IdMissao, Mapa, NPC, Nome, Nivel, Tipo, Cliente, Descricao, MaximoDesmaios, Tempo, Premio, Resumo, RanqueMinimo) VALUES
    (1, 2, 4, 'Jagras da Floresta Antiga', 1, 0, 'Comandante', 'Abata 7 Jagras', 3, 60, 720, 'Derrote os Jagras para garantir a segurança da região.', 1),
    (2, 2, 4, 'A Confusão dos Kestodon', 1, 0, 'Comandante', 'Abata 5 Kestodon Fêmeas e 3 Kestodon Machos', 3, 60, 1200, 'Elimine os Kestodon para proteger os recursos da região.', 1),
    (3, 2, 4, 'A Caçada ao Grande Jagras', 1, 0, 'Comandante', 'Cace um Grande Jagras', 3, 60, 1200, 'Derrote o Grande Jagras para garantir a segurança da região.', 1),
    (4, 2, 4, 'Bandido de Cérebro de Pássaro', 2, 0, 'Comandante', 'Cace um Kulu-Ya-Ku', 3, 60, 1800, 'Cace um Kulu-Ya-Ku que está causando problemas na região.', 2),
    (5, 2, 4, 'Urgente: Caçada ao Pukei-Pukei', 2, 0, 'Comandante', 'Cace um Pukei-Pukei', 3, 60, 2520, 'Um Pukei-Pukei ameaçador foi avistado. Elimine-o imediatamente.', 2),
    (6, 2, 4, 'O Melhor Tipo de Missão', 3, 0, 'Comandante', 'Cace um Barroth', 3, 60, 2520, 'Um Barroth está ameaçando os locais de escavação. Derrote-o para garantir a segurança.', 3),
    (7, 2, 4, 'Sombras Sinistras no Pântano', 3, 0, 'Comandante', 'Cace um Jyuratodus', 3, 60, 3240, 'Um Jyuratodus está causando problemas na área úmida. Elimine a ameaça.', 3),
    (8, 2, 4, 'Centelhas Voadoras: Tobi-Kadachi', 4, 0, 'Comandante', 'Cace um Tobi-Kadachi', 3, 60, 3240, 'Um Tobi-Kadachi está ameaçando a região. Derrote-o para garantir a segurança.', 4),
    (9, 2, 4, 'O Anjanath se Aproxima', 4, 0, 'Comandante', 'Cace um Anjanath', 3, 60, 4320, 'Um Anjanath está se aproximando. Derrote-o para proteger a área.', 4),
    (10, 2, 4, 'Uma para os Livros de História', 5, 0, 'Comandante', 'Capture Zorah Magdaros', 3, 60, 4320, 'Capture Zorah Magdaros para um estudo detalhado.', 4),
    (11, 2, 4, 'Problemas Inflados', 6, 0, 'Comandante', 'Cace um Paolumu', 3, 60, 4320, 'Um Paolumu está causando problemas na área. Elimine-o imediatamente.', 4),
    (12, 2, 4, 'Bloqueio Radobaan', 7, 0, 'Comandante', 'Cace um Radobaan', 3, 60, 4320, 'Um Radobaan está bloqueando uma rota vital. Derrote-o para liberar o caminho.', 4),
    (13, 2, 4, 'Legiana: Encarnação da Elegância', 8, 0, 'Comandante', 'Cace um Legiana', 3, 60, 5400, 'Um Legiana está ameaçando a região. Derrote-o para garantir a segurança.', 5),
    (14, 2, 4, 'Nas Profundezas do Vale', 8, 0, 'Comandante', 'Cace um Odogaron', 3, 60, 5400, 'Um Odogaron está causando problemas na área. Elimine-o para garantir a segurança.', 5),
    (15, 2, 4, 'Um Trono Flamejante no Topo da Floresta', 8, 0, 'Comandante', 'Cace um Rathalos', 3, 60, 5400, 'Um Rathalos está ameaçando a floresta. Derrote-o para garantir a segurança da região.', 5),
    (16, 2, 4, 'Tirano de Chifres Sob as Areias', 8, 0, 'Comandante', 'Cace um Diablos', 3, 60, 5400, 'Um Diablos está causando problemas nas áreas de caça. Elimine-o imediatamente.', 5),
    (17, 2, 4, 'Uma Tarefa Colossal', 10, 0, 'Comandante', 'Repel Zorah Magdaros', 3, 60, 8280, 'Repila o ataque de Zorah Magdaros para proteger a Comissão de Pesquisa.', 6),
    (18, 2, 4, 'Invasor no Deserto', 11, 0, 'Comandante', 'Cace um Pukei-Pukei', 3, 60, 7200, 'Um Pukei-Pukei invasor está causando estragos. Elimine-o para garantir a segurança.', 6),
    (19, 2, 4, 'Rosa Chocante', 12, 0, 'Comandante', 'Cace um Anjanath', 3, 60, 9000, 'Um Anjanath está ameaçando a área. Derrote-o para proteger a Comissão de Pesquisa.', 6),
    (20, 2, 4, 'Monstro do Velho Mundo no Novo Mundo', 13, 0, 'Comandante', 'Cace uma Pink Rathian', 3, 60, 12600, 'Uma Pink Rathian do Velho Mundo apareceu. Elimine a ameaça.', 7),
    (21, 2, 4, 'Uma Ferida e uma Sede', 14, 0, 'Comandante', 'Mate Nergigante', 3, 60, 18000, 'Um Nergigante está causando estragos. Elimine-o para proteger a Comissão de Pesquisa.', 8),
    (22, 2, 4, 'Kushala Daora, Dragão de Aço', 14, 0, 'Comandante', 'Mate Kushala Daora', 3, 60, 18000, 'Um Kushala Daora de aço está ameaçando a região. Derrote-o para garantir a segurança.', 8),
    (23, 2, 4, 'Teostra, o Infernal', 14, 0, 'Comandante', 'Mate Teostra', 3, 60, 18000, 'Um Teostra infernal está causando problemas. Elimine-o imediatamente.', 8),
    (24, 2, 4, 'Demônio Infernal Vaal Hazak', 14, 0, 'Comandante', 'Mate Vaal Hazak', 3, 60, 18000, 'Um Vaal Hazak demoníaco está ameaçando a região. Derrote-o para garantir a segurança.', 8),
    (25, 2, 4, 'Terra da Convergência', 15, 0, 'Comandante', 'Mate Xeno''jiiva', 3, 60, 19800, 'Um Xeno''jiiva apareceu na Terra da Convergência. Elimine a ameaça para a humanidade.', 9),
    (26, 2, 4, 'Além das Escamas Explosivas', 29, 0, 'Comandante', 'Cace dois Bazelgeuse temperados', 3, 60, 27720, 'Dois Bazelgeuse temperados estão causando estragos. Elimine-os para garantir a segurança.', 9),
    (27, 2, 4, 'Ruído Trovejante nas Terras Altas', 49, 0, 'Comandante', 'Mate um Kirin temperado', 3, 60, 21600, 'Um Kirin temperado está causando caos nas terras altas. Elimine-o imediatamente.', 9);

-- Missões Pre Req
INSERT INTO MissaoPreReq (IdMissaoPreReq, MissaoPreReq, Missao) VALUES
    (1, 1, 2), (2, 2, 3), (3, 3, 4), (4, 4, 5), (5, 5, 6),
    (6, 6, 7), (7, 7, 8), (8, 8, 9), (9, 9, 10), (10, 10, 11),
    (11, 11, 12), (12, 12, 13), (13, 13, 14), (14, 14, 15), (15, 15, 16),
    (16, 16, 17), (17, 17, 18), (18, 18, 19), (19, 19, 20), (20, 20, 21),
    (21, 21, 22), (22, 22, 23), (23, 23, 24), (24, 24, 25), (25, 25, 26),
    (26, 26, 27);

-- Inserção de dados na tabela EtapaMonstro
INSERT INTO EtapaMonstro (Missao, Monstro, Quantidade) VALUES
    (1, 72, 7),
    (2, 73, 5),
    (2, 74, 3),
    (3, 28, 1),
    (4, 31, 1),
    (5, 45, 1),
    (6, 8, 1),
    (7, 29, 1),
    (8, 62, 1),
    (9, 4, 1),
    (10, 71, 1),
    (11, 43, 1),
    (12, 46, 1),
    (13, 35, 1),
    (14, 42, 1),
    (15, 49, 1),
    (16, 18, 1),
    (17, 71, 1),
    (18, 45, 1),
    (19, 4, 1),
    (20, 44, 1),
    (21, 40, 1),
    (22, 33, 1),
    (23, 60, 1),
    (24, 65, 1),
    (25, 68, 1),
    (26, 55, 2),
    (27, 30, 1);



COMMIT;