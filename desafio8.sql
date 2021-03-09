DROP TRIGGER IF EXISTS trigger_usuario_delete;

DELIMITER $$
CREATE TRIGGER trigger_usuario_delete
BEFORE DELETE ON Usuario
FOR EACH ROW
BEGIN
DELETE FROM SpotifyClone.Historico 
WHERE
    usuario_id = old.id;
DELETE FROM SpotifyClone.Seguindo 
WHERE
    usuario_id = old.id;
END $$
DELIMITER ;
