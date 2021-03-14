-- Referência do DECLARE: https://github.com/tryber/sd-07-mysql-one-for-all/blob/cosmo-mysql-one-for-all/desafio8.sql
DELIMITER $$
CREATE TRIGGER trigger_usuario_delete
BEFORE DELETE ON users
FOR EACH ROW

BEGIN
DECLARE USER_ID INT;
SET USER_ID = OLD.user_id;

DELETE FROM SpotifyClone.users_history AS HISTORY
WHERE HISTORY.user_history_id = USER_ID;

DELETE FROM SpotifyClone.users_following AS FOLLOW
WHERE FOLLOW.user_following_id = USER_ID;

END $$
DELIMITER ;
