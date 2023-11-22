-- Trigger para que assim que for criado um PC, crie um amigato para ele:

CREATE OR REPLACE FUNCTION criar_amigato_para_pc()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO Amigato (Regiao, PC, Nome, Nivel, Status, Vida)
    VALUES (NEW.Regiao, NEW.IdPlayer, 'Amigato_' || NEW.Nome, 1, 0, 100);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_cria_amigato
AFTER INSERT ON PC
FOR EACH ROW
EXECUTE FUNCTION criar_amigato_para_pc();

-- Trigger para atualizar automaticamente o status da missão:

CREATE OR REPLACE FUNCTION atualiza_status_missao()
RETURNS TRIGGER AS $$
DECLARE
    total_etapas INT;
    etapas_concluidas INT;
BEGIN
    SELECT COUNT(*) INTO total_etapas
    FROM EtapaMissao
    WHERE Missao = NEW.Missao;

    SELECT COUNT(*) INTO etapas_concluidas
    FROM EtapaMissao em
    JOIN RealizaMissao rm ON em.IdEtapaMissao = rm.Missao
    WHERE em.Missao = NEW.Missao AND em.Status = 1;

    IF total_etapas = etapas_concluidas THEN
        UPDATE Missao
        SET Status = 1
        WHERE IdMissao = NEW.Missao;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_atualiza_status_missao
AFTER UPDATE ON EtapaMissao
FOR EACH ROW
EXECUTE FUNCTION atualiza_status_missao();

-- Trigger para realizar a compra de um item por um jogador

CREATE OR REPLACE FUNCTION realizar_compra(
    jogador_id INT,
    item_id INT,
    quantidade INT
) RETURNS VOID AS $$
DECLARE
    custo_total INT;
BEGIN
    SELECT (CustoCompra * quantidade)
    INTO custo_total
    FROM Item
    WHERE IdItem = item_id;

    IF (SELECT Dinheiro FROM PC WHERE IdPlayer = jogador_id) >= custo_total THEN
        INSERT INTO Inventario (PC, CapacidadeMaxima)
        VALUES (jogador_id, 20)
        ON CONFLICT (PC) DO NOTHING;

        INSERT INTO InventarioItem (Inventario, Item, Quantidade)
        VALUES (jogador_id, item_id, quantidade)
        ON CONFLICT (Inventario, Item) DO UPDATE
        SET Quantidade = InventarioItem.Quantidade + quantidade;

        UPDATE PC
        SET Dinheiro = Dinheiro - custo_total
        WHERE IdPlayer = jogador_id;

        RAISE NOTICE 'Compra realizada com sucesso!';
    ELSE
        RAISE EXCEPTION 'Dinheiro insuficiente para realizar a compra!';
    END IF;
END;
$$ LANGUAGE plpgsql;
EXECUTE FUNCTION criar_amigato_para_pc();

-- Trigger para evolução de Amigato:

CREATE OR REPLACE FUNCTION evolui_amigato()
RETURNS TRIGGER AS $$
BEGIN
    UPDATE Amigato
    SET Nivel = Nivel + 1
    WHERE IdAmigato = NEW.Amigato AND NEW.Status = 1;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trig_evolui_amigato
AFTER INSERT ON AtacaMonstro
FOR EACH ROW
EXECUTE FUNCTION evolui_amigato();

-- Trigger para Recompensa Automática ao Vencer uma Missão:

CREATE OR REPLACE FUNCTION recompensa_missao()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO GuardaItem (Inventario, Item)
    SELECT NEW.PC, Item
    FROM Missao
        JOIN DropaItem ON Missao.IdMissao = DropaItem.Missao
    WHERE NEW.Missao = Missao.IdMissao;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trig_recompensa_missao
AFTER UPDATE ON RealizaMissao
FOR EACH ROW
WHEN (NEW.Status = 1)
EXECUTE FUNCTION recompensa_missao();

-- Trigger para atualizar status do amigato após uma missão bem-sucedida:

CREATE OR REPLACE FUNCTION atualiza_status_amigato()
RETURNS TRIGGER AS $$
BEGIN
    UPDATE Amigato
    SET Status = 1
    WHERE IdAmigato = NEW.Amigato AND NEW.Status = 1;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trig_atualiza_status_amigato
AFTER UPDATE ON RealizaMissao
FOR EACH ROW
WHEN (NEW.Status = 1)
EXECUTE FUNCTION atualiza_status_amigato();

-- Procedure para atualizar o status da missão:

CREATE OR REPLACE FUNCTION atualizar_status_missao(
    p_missao_id INT,
    p_novo_status INT
)
RETURNS VOID AS $$
BEGIN
    UPDATE Missao
    SET Status = p_novo_status
    WHERE IdMissao = p_missao_id;
    RAISE NOTICE 'Status da missão atualizado com sucesso!';
END;
$$ LANGUAGE plpgsql;

-- Procedure para conclusão de uma etapa da missão:

CREATE OR REPLACE FUNCTION concluir_etapa_missao(
    p_etapa_id INT
)
RETURNS VOID AS $$
BEGIN
    UPDATE EtapaMissao
    SET Status = 1
    WHERE IdEtapaMissao = p_etapa_id;
    RAISE NOTICE 'Etapa de missão concluída com sucesso!';
END;
$$ LANGUAGE plpgsql;

-- Procedure para Trocar de Armadura:

CREATE OR REPLACE FUNCTION trocar_armadura(
    p_player_id INT,
    p_nova_armadura_id INT
)
RETURNS VOID AS $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM Armadura WHERE IdArmadura = p_nova_armadura_id) THEN
        RAISE EXCEPTION 'Armadura não encontrada!';
    END IF;

    UPDATE PC
    SET Armadura = p_nova_armadura_id
    WHERE IdPlayer = p_player_id;

    RAISE NOTICE 'Armadura trocada com sucesso!';
END;
$$ LANGUAGE plpgsql;

-- Procedure para Comprar Item na Loja:

CREATE OR REPLACE FUNCTION comprar_item_na_loja(
    p_player_id INT,
    p_loja_id INT,
    p_item_id INT,
    p_quantidade INT
)
RETURNS VOID AS $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM PC WHERE IdPlayer = p_player_id) THEN
        RAISE EXCEPTION 'Jogador não encontrado!';
    END IF;

    IF NOT EXISTS (SELECT 1 FROM Loja WHERE IdLoja = p_loja_id) THEN
        RAISE EXCEPTION 'Loja não encontrada!';
    END IF;

    IF NOT EXISTS (
        SELECT 1
        FROM VendeItem
        WHERE Loja = p_loja_id
          AND Item = p_item_id
    ) THEN
        RAISE EXCEPTION 'Item não disponível nesta loja!';
    END IF;

    DECLARE custo_total INT;
    SELECT CustoCompra * p_quantidade INTO custo_total
    FROM Item
    WHERE IdItem = p_item_id;

    IF NOT EXISTS (
        SELECT 1
        FROM PC
        WHERE IdPlayer = p_player_id
          AND Dinheiro >= custo_total
    ) THEN
        RAISE EXCEPTION 'Dinheiro insuficiente para comprar o item!';
    END IF;

    INSERT INTO InventarioItem (Inventario, Item, Quantidade)
    VALUES (p_player_id, p_item_id, p_quantidade)
    ON CONFLICT (Inventario, Item) DO UPDATE
    SET Quantidade = InventarioItem.Quantidade + p_quantidade;

    UPDATE PC
    SET Dinheiro = Dinheiro - custo_total
    WHERE IdPlayer = p_player_id;

    RAISE NOTICE 'Compra realizada com sucesso!';
END;
$$ LANGUAGE plpgsql;

-- Procedure para Criar Nova Arma na Forja:

CREATE OR REPLACE FUNCTION criar_nova_arma_na_forja(
    p_forja_id INT,
    p_tipo_arma INT,
    p_nome VARCHAR(64),
    p_nivel INT,
    p_raridade INT,
    p_custo_compra INT,
    p_valor_venda INT,
    p_descricao VARCHAR(256),
    p_ataque INT,
    p_afiacao INT,
    p_elemento VARCHAR(32),
    p_valor_elemento INT
)
RETURNS VOID AS $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM Forja WHERE IdForja = p_forja_id) THEN
        RAISE EXCEPTION 'Forja não encontrada!';
    END IF;

    INSERT INTO Equipamento (Categoria)
    VALUES (1)
    RETURNING IdEquipamento INTO p_nova_arma_id;

    INSERT INTO Arma (
        IdArma, Nome, Nivel, Raridade, CustoCompra,
        ValorVenda, Descricao, Tipo, Ataque, Afiacao,
        Elemento, ValorElemento
    )
    VALUES (
        p_nova_arma_id, p_nome, p_nivel, p_raridade, p_custo_compra,
        p_valor_venda, p_descricao, p_tipo_arma, p_ataque, p_afiacao,
        p_elemento, p_valor_elemento
    );

    INSERT INTO CriaEquipamento (Forja, Equipamento)
    VALUES (p_forja_id, p_nova_arma_id);

    RAISE NOTICE 'Nova arma criada na forja com sucesso!';
END;
$$ LANGUAGE plpgsql;

-- Procedure para Adicionar Item ao Inventario de um Jogador:

CREATE OR REPLACE FUNCTION adicionar_item_ao_inventario(
    p_player_id INT,
    p_item_id INT,
    p_quantidade INT
)
RETURNS VOID AS $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM PC WHERE IdPlayer = p_player_id) THEN
        RAISE EXCEPTION 'Jogador não encontrado!';
    END IF;

    IF NOT EXISTS (SELECT 1 FROM Item WHERE IdItem = p_item_id) THEN
        RAISE EXCEPTION 'Item não encontrado!';
    END IF;

    INSERT INTO InventarioItem (Inventario, Item, Quantidade)
    VALUES (p_player_id, p_item_id, p_quantidade)
    ON CONFLICT (Inventario, Item) DO UPDATE
    SET Quantidade = InventarioItem.Quantidade + p_quantidade;

    RAISE NOTICE 'Item adicionado ao inventário com sucesso!';
END;
$$ LANGUAGE plpgsql;

-- Procedure para Compra de Item:

CREATE OR REPLACE FUNCTION comprar_item_na_loja(
    p_player_id INT,
    p_loja_id INT,
    p_item_id INT,
    p_quantidade INT
)
RETURNS VOID AS $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM PC WHERE IdPlayer = p_player_id) THEN
        RAISE EXCEPTION 'Jogador não encontrado!';
    END IF;

    IF NOT EXISTS (SELECT 1 FROM Loja WHERE IdLoja = p_loja_id) THEN
        RAISE EXCEPTION 'Loja não encontrada!';
    END IF;

    IF NOT EXISTS (
        SELECT 1
        FROM VendeItem
        WHERE Loja = p_loja_id
          AND Item = p_item_id
    ) THEN
        RAISE EXCEPTION 'Item não disponível nesta loja!';
    END IF;

    DECLARE custo_total INT;
    SELECT CustoCompra * p_quantidade INTO custo_total
    FROM Item
    WHERE IdItem = p_item_id;

    IF NOT EXISTS (
        SELECT 1
        FROM PC
        WHERE IdPlayer = p_player_id
          AND Dinheiro >= custo_total
    ) THEN
        RAISE EXCEPTION 'Dinheiro insuficiente para comprar o item!';
    END IF;

    INSERT INTO InventarioItem (Inventario, Item, Quantidade)
    VALUES (p_player_id, p_item_id, p_quantidade)
    ON CONFLICT (Inventario, Item) DO UPDATE
    SET Quantidade = InventarioItem.Quantidade + p_quantidade;

    UPDATE PC
    SET Dinheiro = Dinheiro - custo_total
    WHERE IdPlayer = p_player_id;

    RAISE NOTICE 'Compra realizada com sucesso!';
END;
$$ LANGUAGE plpgsql;
