DELIMITER $$
CREATE TRIGGER trigger_usuario_delete
BEFORE DELETE ON usuarios
FOR EACH ROW 
BEGIN 
DELETE FROM historico_reproducao
WHERE 
OLD.usuario_id = usuario_id;
DELETE FROM seguindo 
WHERE
OLD.usuario_id = usuario_id;
END $$
DELIMITER ;
