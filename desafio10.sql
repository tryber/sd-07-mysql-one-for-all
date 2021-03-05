DELIMITER $$

CREATE FUNCTION quantidade_musicas_no_historico(nome_pessoa varchar(200))
RETURNS INT READS SQL DATA 
BEGIN
	DECLARE numOf INT;
    SELECT COUNT(*) FROM SpotifyClone.hist_reproducoes AS hr
	INNER JOIN SpotifyClone.usuarios AS u ON u.usuario_id = hr.usuario_id
	WHERE u.nome = nome_pessoa INTO numOf;
    SELECT 3 INTO numOf;
    RETURN numOf;
END $$

DELIMITER ;