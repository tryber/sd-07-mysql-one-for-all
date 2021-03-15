USE SpotifyClone;
DELIMITER $$

CREATE FUNCTION quantidade_musicas_no_historico(codigo_usuario INT)
RETURNS INT READS SQL DATA
BEGIN
	DECLARE qtd_historico INT;
SELECT 
    COUNT(h.cancao_id) 
FROM
    SpotifyClone.historico_de_reproducoes AS h
        JOIN
    SpotifyClone.usuario AS u ON h.usuario_id = u.usuario_id
WHERE
    u.usuario_id = codigo_usuario INTO qtd_historico;
    RETURN qtd_historico;
END $$

DELIMITER ;
