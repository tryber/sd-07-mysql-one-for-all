USE SpotifyClone
DELIMITER $$
CREATE TRIGGER trigger_usuario_delete
BEFORE DELETE 
ON SpotifyClone.Usuario
FOR EACH ROW
BEGIN
DELETE FROM SpotifyClone.Artista_Seguidos
WHERE usuario_id = OLD.usuario_id;
DELETE FROM SpotifyClone.HistoricoReproducao
WHERE usuario_id = OLD.usuario_id;
END $$

DELIMITER ;
