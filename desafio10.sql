CREATE FUNCTION quantidade_musicas_no_historico(codigo VARCHAR(100))
RETURNS INT READS SQL DATA
BEGIN
DECLARE qtd_music INT;
SELECT COUNT(H.user_id)
FROM SpotifyClone.history_reproduction AS H
WHERE H.user_id = codigo INTO qtd_music;
RETURN qtd_music;
END $$

DELIMITER ;

SELECT quantidade_musicas_no_historico(3);
