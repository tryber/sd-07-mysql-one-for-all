DELIMITER $$
CREATE TRIGGER trigger_usuario_delete
BEFORE DELETE ON SpotifyClone.user
FOR EACH ROW
BEGIN
DELETE FROM SpotifyClone.following_artists WHERE OLD.user_id = SpotifyClone.following_artists.user_id;
DELETE FROM SpotifyClone.reproduction_history WHERE OLD.user_id = SpotifyClone.reproduction_history.user_id;
END $$
DELIMITER ;
