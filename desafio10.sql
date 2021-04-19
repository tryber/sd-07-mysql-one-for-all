DELIMITER $$
CREATE FUNCTION quantidade_musicas_no_historico(id INT)
    RETURNS INT READS SQL DATA
    BEGIN
        DECLARE quantidade INT;
        SELECT COUNT(cancao_id)
        FROM SpotifyClone.HistoricoReproducao
        WHERE HistoricoReproducao.usuario_id = id
        INTO quantidade;
        RETURN quantidade;
END $$
DELIMITER ;
