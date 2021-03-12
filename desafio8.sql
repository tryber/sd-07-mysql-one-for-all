DELIMITER $$
CREATE TRIGGER trigger_usuario_delete
BEFORE DELETE ON usuario
FOR EACH ROW
BEGIN
DELETE FROM SpotifyClone.historico_reproducao WHERE id_usuario = OLD.id_usuario
DELETE FROM SpotifyClone.seguindo_artistas WHERE id_usuario = OLD.id_usuario
END $$
DELIMITER;
