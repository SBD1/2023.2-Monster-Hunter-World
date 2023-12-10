CREATE OR REPLACE PROCEDURE AtualizarFoiExecutadoParaFala(IN p_IdItem INT)
AS $AtualizarFoiExecutadoParaFalaFunction$
BEGIN
    UPDATE Fala
    SET FoiExecutado = true
    WHERE IdFala = p_IdItem;
END;
$AtualizarFoiExecutadoParaFalaFunction$ LANGUAGE plpgsql;


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
