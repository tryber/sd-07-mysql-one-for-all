USE SpotifyClone;

DELIMITER $$
CREATE PROCEDURE albuns_do_artista(IN artista VARCHAR(20))
BEGIN
  SELECT ART.nome AS artista, ALB.album AS album FROM SpotifyClone.artistas ART
INNER JOIN SpotifyClone.albuns ALB
ON ART.artista_id = ALB.artista_id
WHERE ART.nome LIKE CONCAT('%', artista, '%')
ORDER BY 2;
END $$
DELIMITER ;
