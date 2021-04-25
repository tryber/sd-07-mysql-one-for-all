USE SpotifyClone;
DELIMITER $$

CREATE FUNCTION quantidade_musicas_no_historico(id INT)
RETURNS INT READS SQL DATA
BEGIN
DECLARE quantidade_de_musicas INT;
SELECT
COUNT(historico_reproducoes.cancoes_id)
FROM SpotifyClone.historico_reproducoes AS historico_reproducoes
WHERE historico_reproducoes.usuario_id = id
INTO quantidade_de_musicas;
RETURN quantidade_de_musicas;
END $$

DELIMITER ;
