DELIMITER $$

CREATE PROCEDURE albuns_do_artista( IN artista_input varchar(50))
BEGIN
SELECT 
    art.nome AS artista, alb.nome AS album
FROM
    SpotifyClone.Artista art
        INNER JOIN
    SpotifyClone.Album AS alb ON alb.artista_id = art.id
WHERE
    art.nome = artista_input;
END $$
ORDER BY album;

DELIMITER ;
