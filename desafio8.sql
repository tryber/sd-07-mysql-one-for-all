delimiter $$

CREATE TRIGGER trigger_usuario_delete
BEFORE DELETE ON Usuarios
FOR EACH ROW
BEGIN
DELETE FROM Historico_Usuarios WHERE fk_usuario_id = old.usuario_id;
DELETE FROM Artistas_Seguidores WHERE fk_usuario_id = old.usuario_id;
END $$

delimiter ;
