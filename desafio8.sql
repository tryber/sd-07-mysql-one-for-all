USE SpotifyClone;
DELIMITER $$
CREATE TRIGGER trigger_usuario_delete11
BEFORE DELETE ON users
FOR EACH ROW
BEGIN
DELETE FROM followingArtists WHERE user_id = OLD.user_id;
DELETE FROM playedMusicHistory WHERE user_id = OLD.user_id;
    
END $$
DELIMITER;
