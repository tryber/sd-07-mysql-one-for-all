DELIMITER $$

CREATE FUNCTION quantidade_musicas_no_historico(codigoUsuarioHistorico INT)
RETURNS INT READS SQL DATA
BEGIN
	DECLARE qntdMusicasHistorico INT;
    SELECT COUNT(hr.cancao_id)
    FROM SpotifyClone.historico_de_reproducao hr
    INNER JOIN SpotifyClone.usuario u
    WHERE codigoUsuarioHistorico = u.usuario_id
    GROUP BY u.usuario_id
    INTO qntdMusicasHistorico;
    RETURN qntdMusicasHistorico;
END $$

DELIMITER ;

SELECT quantidade_musicas_no_historico(3)
