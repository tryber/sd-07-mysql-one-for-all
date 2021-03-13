DELIMITER $$
CREATE TRIGGER trigger_usuario_delete
    BEFORE DELETE ON SpotifyClone.usuario
    FOR EACH ROW
BEGIN
    DELETE FROM seguindo;
    DELETE FROM historico
WHERE
    usuario_id = OLD.usuario_id;    
END;
$$
DELIMITER ;
