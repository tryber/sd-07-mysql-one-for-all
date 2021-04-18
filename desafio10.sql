DELIMITER $$

CREATE FUNCTION quantidade_musicas_no_historico(id INT)
RETURNS INT READS SQL DATA
BEGIN
DECLARE quantidade_musicas INT;
SELECT COUNT(cancao_id)
FROM SpotifyClone.historico_reproducoes
WHERE usuario_id = id INTO quantidade_musicas;
RETURN quantidade_musicas;
END $$

DELIMITER ;
