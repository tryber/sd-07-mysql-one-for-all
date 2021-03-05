USE SpotifyClone;

DELIMITER $$
CREATE TRIGGER trigger_usuario_delete
    BEFORE DELETE ON usuarios
    FOR EACH ROW
BEGIN
    DELETE FROM historico_usuario
    WHERE usuario_id = OLD.id;
    DELETE FROM artistas_seguidos
    WHERE usuario_id = OLD.id;
END $$
DELIMITER ;
