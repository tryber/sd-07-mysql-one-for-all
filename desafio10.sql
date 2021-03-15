USE SpotifyClone;

DELIMITER $$
CREATE FUNCTION quantidade_musicas_no_historico(usuario_id INT)
RETURNS INT READS SQL DATA
BEGIN
DECLARE quantidade_musicas INT;
SELECT COUNT(historico.usuario_id) AS artista
FROM historico_reproducoes AS historico
WHERE historico.usuario_id = usuario_id
  INTO quantidade_musicas;
RETURN quantidade_musicas;
END $$
DELIMITER ;
