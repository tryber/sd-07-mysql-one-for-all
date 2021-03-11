DELIMITER $$

CREATE FUNCTION quantidade_musicas_no_historico(usuario_id int)
RETURNS INT READS SQL DATA
BEGIN
  DECLARE total_cancoes INT;
  SELECT COUNT(UC.cancao_id)
	FROM SpotifyClone.usuarios AS U
	INNER JOIN SpotifyClone.usuarios_cancoes UC ON U.usuario_id = UC.usuario_id
	WHERE U.usuario_id = usuario_id
	GROUP BY UC.usuario_id
    INTO total_cancoes;
    RETURN total_cancoes;
END $$

DELIMITER ;
