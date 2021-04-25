DELIMITER $$
CREATE TRIGGER trigger_usuario_delete
BEFORE DELETE ON usuario
FOR EACH ROW
BEGIN
DECLARE user_id INT;
SET user_id = OLD.usuario_id;
DELETE FROM SpotifyClone.historico_reproducao
WHERE usuario_id = user_id;
DELETE FROM SpotifyClone.seguidor
WHERE usuario_id = user_id;
END $$
DELIMITER ;
