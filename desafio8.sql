USE SpotifyClone;
DELIMITER $$
CREATE TRIGGER trigger_usuario_delete
BEFORE DELETE ON usuario
FOR EACH ROW
BEGIN
DELETE FROM seguindo_artistas WHERE usuario_id = OLD.usuario_id;
DELETE FROM historico_reproducoes 
WHERE
    usuario_id = OLD.usuario_id;
END $$
DELIMITER ;
