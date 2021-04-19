DELIMITER $$
CREATE FUNCTION quantidade_musicas_no_historico(usuario_id INT)
RETURNS INT READS SQL DATA
BEGIN
DECLARE quantidade_cancoes INT;
SELECT
COUNT(historico.cancao_id)
FROM SpotifyClone.historico_de_reproducoes AS historico
WHERE historico.usuario_id = usuario_id
INTO quantidade_cancoes ;
RETURN quantidade_cancoes;
END $$
DELIMITER ;
