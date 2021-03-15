DELIMITER $$
CREATE TRIGGER trigger_usuario_delete
    BEFORE DELETE ON SpotifyClone.usuarios
    FOR EACH ROW
BEGIN
    DELETE FROM SpotifyClone.historico WHERE SpotifyClone.historico.usuario_id = OLD.id;
    DELETE FROM SpotifyClone.seguindo WHERE SpotifyClone.seguindo.usuario_id = OLD.id;
END $$
DELIMITER ;