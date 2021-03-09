DELIMITER $$
CREATE TRIGGER trigger_usuario_delete
BEFORE DELETE ON Usuario
FOR EACH ROW
BEGIN
DELETE FROM Historico 
WHERE
    usuario_id = old.nome;
DELETE FROM Seguindo 
WHERE
    usuario_id = old.nome;
END $$
DELIMITER ;
