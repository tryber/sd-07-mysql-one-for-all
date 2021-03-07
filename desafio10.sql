USE SpotifyClone;
DELIMITER $$
CREATE FUNCTION quantidade_musicas_no_historico(usuario_id INT)
RETURNS INT READS SQL DATA
BEGIN
  DECLARE qtd_musicas INT;
  SELECT COUNT(cancao_id)
  FROM SpotifyClone.historico_de_reproducoes
  WHERE SpotifyClone.historico_de_reproducoes.usuario_id = usuario_id INTO qtd_musicas;
  RETURN qtd_musicas;
END $$
DELIMITER ;
