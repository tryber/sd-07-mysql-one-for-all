DELIMITER $$

CREATE FUNCTION quantidade_musicas_no_historico(usuario INT) RETURNS INT READS SQL DATA

BEGIN

DECLARE musicas INT;

SELECT COUNT(usuario_id)
FROM SpotifyClone.historico
WHERE usuario_id = usuario INTO musicas;
RETURN musicas;

END;

$$ DELIMITER ;

SELECT quantidade_musicas_no_historico(3);
