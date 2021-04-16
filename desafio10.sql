DELIMITER $$

CREATE FUNCTION quantidade_musicas_no_historico(pessoa_id INT)
RETURNS INT READS SQL DATA
BEGIN
  DECLARE quantidade_musicas INT;
  SELECT COUNT(h.usuario_id)
  FROM SpotifyClone.historico h
  WHERE h.usuario_id = pessoa_id
  INTO quantidade_musicas;
  RETURN quantidade_musicas;
END $$

DELIMITER ;
