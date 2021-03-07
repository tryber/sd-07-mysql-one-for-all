DELIMITER $$
CREATE TRIGGER trigger_usuario_delete
    BEFORE DELETE ON SpotifyClone.Usuario
    FOR EACH ROW
BEGIN
    DELETE FROM SpotifyClone.HistoricoReproducao WHERE usuario_id = OLD.id;
    DELETE FROM SpotifyClone.UsuarioSeguindoArtista WHERE usuario_id = OLD.id;
END $$ 
DELIMITER ;
