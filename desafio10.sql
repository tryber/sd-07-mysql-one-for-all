DELIMITER $$

CREATE FUNCTION quantidade_musicas_no_historico (usuario_id INT)
RETURNS INT READS SQL DATA
BEGIN
DECLARE quantidade_musicas_no_historico INT;
SELECT
COUNT(*) INTO quantidade_musicas_no_historico
FROM SpotifyClone.historicos AS hist
JOIN SpotifyClone.usuarios as usr
ON usr.usuario_id = hist.usuario_id
WHERE usr.usuario_id = usuario_id;
RETURN quantidade_musicas_no_historico;
END $$

DELIMITER ;
