-- Reference: https://dba.stackexchange.com/questions/108037
USE SpotifyClone;
DELIMITER $$
CREATE TRIGGER trigger_usuario_delete
BEFORE DELETE ON usuario
FOR EACH ROW
BEGIN
DELETE FROM artistas_seguidos WHERE usuario_id = OLD.usuario_id;
DELETE FROM historico_reproducoes WHERE usuario_id = OLD.usuario_id;
END $$
DELIMITER ;
