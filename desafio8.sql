DELIMITER ||
CREATE TRIGGER trigger_usuario_delete
AFTER DELETE ON Usuario
FOR EACH ROW
BEGIN
DELETE FROM Historico 
WHERE
    usuario_id = OLD.id;
DELETE FROM Seguindo 
WHERE
    usuario_id = OLD.id;
END ||
DELIMITER ;
