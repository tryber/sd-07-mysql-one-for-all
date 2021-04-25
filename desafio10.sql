USE SpotifyClone;

DELIMITER $$

CREATE FUNCTION quantidade_musicas_no_historico(USER_ID INT)
-- Referência do RETURNS: https://github.com/tryber/sd-07-mysql-one-for-all/blob/elanoevaristo-mysql-one-for-all/desafio10.sql
RETURNS INT READS SQL DATA
BEGIN
  DECLARE numberOfSongs INT;
  SELECT COUNT(HISTORY.song_history_id) INTO numberOfSongs
  FROM SpotifyClone.users_history AS HISTORY WHERE HISTORY.user_history_id = USER_ID;
  RETURN numberOfSongs;
END

DELIMITER ;
