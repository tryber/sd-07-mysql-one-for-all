DELIMITER $
CREATE TRIGGER trigger_usuario_delete 
BEFORE DELETE ON users
FOR EACH ROW
BEGIN
    DELETE FROM historic WHERE id_user = OLD.id_user;
    DELETE FROM followers WHERE id_user = OLD.id_user;
END
$
DELIMITER ;
