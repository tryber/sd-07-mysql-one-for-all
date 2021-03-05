USE SpotifyClone;

DELIMITER $$

CREATE PROCEDURE albuns_do_artista(IN artista_name VARCHAR(100))
BEGIN
SELECT a.nome_artista AS artista ,
ab.nome_album AS album
FROM SpotifyClone.albuns AS ab
INNER JOIN SpotifyClone.artistas AS a
ON a.id = ab.artista_id
WHERE a.nome_artista = artista_name;
END $$
DELIMITER $$
