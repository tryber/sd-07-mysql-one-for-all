DELIMITER $$
CREATE FUNCTION quantidade_musicas_no_historico(idpessoa INT)
RETURNS INT READS SQL DATA
BEGIN
	DECLARE quantidade INT;
    SELECT
    COUNT(musicas_idmusicas)
	FROM SpotifyClone.usuario_musicas
	WHERE usuario_idusuario = idpessoa
    INTO quantidade;
    RETURN quantidade;
END$$