DELIMITER $$

CREATE TRIGGER trigger_usuario_delete
BEFORE DELETE
ON SpotifyClone.user FOR EACH ROW
BEGIN
DELETE FROM SpotifyClone.music_play_history
WHERE user_id = OLD.id;
DELETE FROM SpotifyClone.artist_followers
WHERE user_id = OLD.id;
END $$

DELIMITER ;
