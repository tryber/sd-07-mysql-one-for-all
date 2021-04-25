USE SpotifyClone;
DELIMITER $$
CREATE TRIGGER trigger_usuario_delete
BEFORE DELETE ON usuarios
FOR EACH ROW
BEGIN
DELETE FROM seguindo_artistas WHERE OLD.id_usuario = id_usuario;
DELETE FROM historico_reproducoes WHERE OLD.id_usuario = id_usuario;
END $$
DELIMITER ;
