DELIMITER $$
CREATE TRIGGER trigger_usuario_delete
BEFORE DELETE ON usuario
FOR EACH ROW
BEGIN
DELETE FROM seguindo_artista WHERE usuario_id = OLD.usuario_id;
DELETE FROM historico_reproducao WHERE usuario_id = OLD.usuario_id;    
END $$
DELIMITER ;
