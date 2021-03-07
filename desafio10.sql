DELIMITER $$

CREATE FUNCTION quantidade_musicas_no_historico(nomeUsuario VARCHAR(50))
RETURNS INT READS SQL DATA
BEGIN
DECLARE retorneNumero INT;
SELECT COUNT(uoc.cancao_id) AS quantidade_musicas_no_historico
FROM SpotifyClone.usuario_ouve_cancao AS uoc
INNER JOIN SpotifyClone.usuarios AS u ON uoc.usuario_id = u.id
WHERE u.nome = nomeUsuario INTO retorneNumero;
RETURN retorneNumero;
END $$

DELIMITER ;
