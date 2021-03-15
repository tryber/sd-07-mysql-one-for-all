DELIMITER $$
CREATE TRIGGER trigger_usuario_delete
BEFORE DELETE ON SpotifyClone.users
FOR EACH ROW

BEGIN
DELETE FROM SpotifyClone.users_history AS HISTORY
WHERE HISTORY.user_history_id = OLD.user_id;

DELETE FROM SpotifyClone.users_following AS FOLLOW
WHERE FOLLOW.user_following_id = OLD.user_id;

END $$
DELIMITER ;
