USE SpotifyClone;
DELIMITER $$

CREATE FUNCTION quantidade_musicas_no_historico(id INT)
RETURNS INT READS SQL DATA
BEGIN
DECLARE quantidadeMusicas INT;
SELECT
COUNT(his.cancao_id)
FROM SpotifyClone.HistoricoReproducao AS `his`
WHERE his.usuario_id = id
INTO quantidadeMusicas;
RETURN quantidadeMusicas;
END $$

DELIMITER ;
