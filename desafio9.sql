USE SpotifyClone;
DELIMITER $$

CREATE PROCEDURE albuns_do_artista(IN artista_nome VARCHAR(40))
BEGIN
SELECT ARTS.artista_nome AS artista, ALB.album_nome AS album FROM SpotifyClone.artistas AS ARTS
INNER JOIN SpotifyClone.albuns AS ALB
ON ARTS.artista_id = ALB.artista_id
WHERE ARTS.artista_nome LIKE CONCAT('%', artista_nome, '%')
ORDER BY 2;
END $$
DELIMITER ;
