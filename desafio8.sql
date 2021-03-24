USE SpotifyClone;
DELIMITER $$

CREATE TRIGGER trigger_usuario_delete
BEFORE DELETE ON usuarios
FOR EACH ROW
BEGIN
SET @user_ID = (SELECT usuario_id
FROM usuarios
WHERE nome = OLD.nome);
DELETE FROM historico_de_reproducoes
WHERE usuario_id=@user_ID;
DELETE FROM seguidores
WHERE usuario_id=@user_ID;
END $$

DELIMITER ;
