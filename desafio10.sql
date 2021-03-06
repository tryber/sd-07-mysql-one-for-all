DELIMITER $$
CREATE PROCEDURE quantidade_musicas_no_historico(IN id VARCHAR(50))
BEGIN
SELECT COUNT(*) AS quantidade_musicas_no_historico
FROM SpotifyClone.historico 
INNER JOIN SpotifyClone.usuarios AS u
ON u.usuario_id = historico.usuario_id
WHERE usuario = id;
END $$
DELIMITER ;
