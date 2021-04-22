DELIMITER $$

CREATE FUNCTION quantidade_musicas_no_historico(codigoUsuarioHistorico INT)
RETURNS INT READS SQL DATA
BEGIN
  DECLARE qntdMusicasHistorico INT;
  SELECT COUNT(cancao_id)
  FROM SpotifyClone.historico_de_reproducao hr
  WHERE codigoUsuarioHistorico = hr.usuario_id
  GROUP BY usuario_id
  INTO qntdMusicasHistorico;
  RETURN qntdMusicasHistorico;
END $$

DELIMITER ;

SELECT quantidade_musicas_no_historico(3);
