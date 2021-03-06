USE SpotifyClone;
DELIMITER $$

CREATE TRIGGER trigger_usuario_delete 
BEFORE DELETE ON SpotifyClone.usuarios
FOR EACH ROW
BEGIN
DELETE s, hr
FROM SpotifyClone.seguindo s
JOIN SpotifyClone.historico_de_reproducoes hr
ON s.usuario_id = hr.usuario_id
WHERE OLD.usuario_id = s.usuario_id;
-- DELETE FROM SpotifyClone.seguindo s WHERE OLD.usuario_id = s.usuario_id;
-- DELETE FROM SpotifyClone.historico_de_reproducoes hr WHERE OLD.usuario_id = hr.usuario_id;
END $$

DELIMITER ;
