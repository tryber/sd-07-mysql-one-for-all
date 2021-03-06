USE spotifyclone;

DELIMITER $$
CREATE TRIGGER trigger_usuario_delete
    BEFORE DELETE ON usuario
    FOR EACH ROW
BEGIN
    DELETE FROM seguindo_artista AS sa WHERE sa.usuario_id = OLD.usuario_id;
    DELETE FROM historico_reproducao AS hr WHERE hr.usuario_id = OLD.usuario_id;    
END $$
DELIMITER ;
