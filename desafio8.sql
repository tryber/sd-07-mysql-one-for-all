DELIMITER $$
CREATE TRIGGER trigger_usuario_delete
BEFORE DELETE ON SpotifyClone.Usuario
FOR EACH ROW
BEGIN
DELETE FROM SpotifyClone.Historico 
WHERE
    SpotifyClone.Historico.usuario_id = OLD.id;
DELETE FROM SpotifyClone.Seguindo 
WHERE
    SpotifyClone.Seguindo.usuario_id = OLD.id;
END $$
DELIMITER ;
