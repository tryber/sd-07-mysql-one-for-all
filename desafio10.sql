USE SpotifyClone;
DELIMITER $$

CREATE FUNCTION quantidade_musicas_no_historico(user_id int)
RETURNS INT READS SQL DATA
BEGIN
DECLARE song_total INT;
SELECT COUNT(*)
FROM SpotifyClone.historico
WHERE SpotifyClone.historico.usuario_id = user_id INTO song_total;
RETURN song_total;
END $$

DELIMITER ;

SELECT quantidade_musicas_no_historico(3);
