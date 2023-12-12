
CREATE OR REPLACE PROCEDURE PegarMissao(
    p_user_id INT,
    p_missao_id INT
)
AS $PegarMissaoFunction$
DECLARE
    v_regiao_destino INT;
BEGIN
    INSERT INTO RealizaMissao (Missao, PC, Status)
    VALUES (p_missao_id, p_user_id, 1);


    
    INSERT INTO RealizaEtapa (EtapaMissao, Quantidade, PC)
    SELECT IdEtapaMonstro, 0, p_user_id
    FROM EtapaMonstro
    WHERE Missao = p_missao_id;

    SELECT MIN(R.IdRegiao) INTO v_regiao_destino
    FROM Missao M
    JOIN Regiao R ON M.Mapa = R.Mapa
    WHERE M.IdMissao = p_missao_id;

    UPDATE PC
    SET Regiao = v_regiao_destino
    WHERE IdPlayer = p_user_id;

    RAISE NOTICE 'Missão obtida com sucesso!';
END;
$PegarMissaoFunction$ LANGUAGE plpgsql;


-- Criar Trigger
CREATE OR REPLACE FUNCTION criar_inventario()
RETURNS TRIGGER AS $criar_inventario_trigger$
BEGIN
    INSERT INTO Inventario (PC)
    VALUES (NEW.IdPlayer);

    RETURN NEW;
END;
$criar_inventario_trigger$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER trigger_criar_inventario
AFTER INSERT
ON PC
FOR EACH ROW
EXECUTE FUNCTION criar_inventario();


