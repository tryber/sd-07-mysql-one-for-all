USE SpotifyClone;

DELIMITER $$
CREATE FUNCTION quantidade_musicas_no_historico(usuario VARCHAR(50))
RETURNS INT READS SQL DATA
BEGIN
DECLARE resultado INT;
SELECT
COUNT(r.musica_id)
FROM SpotifyClone.reproductions AS r
INNER JOIN
SpotifyClone.users AS u
ON
u.usuario_id = r.usuario_id
WHERE
usuario = u.nome_usuario
GROUP BY u.usuario_id
INTO resultado;
RETURN resultado;
END $$
DELIMITER ;
