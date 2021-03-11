DELIMITER $$
CREATE TRIGGER trigger_usuario_delete
BEFORE DELETE ON usuario
FOR EACH ROW
BEGIN
DELETE FROM usuario_artistas
WHERE usuario_idusuario = OLD.idusuario;
DELETE FROM usuario_musicas
WHERE usuario_idusuario = OLD.idusuario;
END;
$$ DELIMITER;
