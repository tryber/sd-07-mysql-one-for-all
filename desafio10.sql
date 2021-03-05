USE SpotifyClone;
DELIMITER $$

CREATE FUNCTION quantidade_musicas_no_historico(id INT)
RETURNS INT READS SQL DATA
BEGIN
DECLARE totalMusicas INT;
SELECT COUNT(*) AS 'quantidade_musicas_no_historico'
FROM SpotifyClone.music_play_history
WHERE user_id = id
INTO totalMusicas;
RETURN totalMusicas;
END $$
