USE SpotifyClone; 
DELIMITER $$
CREATE FUNCTION quantidade_musicas_no_historico(pessoa_id VARCHAR(60))
RETURNS INT READS SQL DATA
BEGIN
DECLARE qtd_musicas INT;
SELECT COUNT(*)
FROM SpotifyClone.historicos AS hi
INNER JOIN SpotifyClone.users AS us
ON hi.usuario_id = us.usuario_id
WHERE us.usuario = 'Bill'
GROUP BY us.usuario_id
INTO qtd_musicas;	
RETURN qtd_musicas;
END $$
DELIMITER ;
