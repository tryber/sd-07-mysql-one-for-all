USE SpotifyClone;
DROP PROCEDURE IF EXISTS albuns_do_artista;
DELIMITER $$

CREATE PROCEDURE albuns_do_artista(IN nome_artista VARCHAR(100))
BEGIN
	SELECT a.artista_nome AS artista, al.album_nome AS album
    FROM SpotifyClone.artista AS a
    JOIN SpotifyClone.album AS al ON a.artista_id = al.artista_id
    WHERE a.artista_nome = nome_artista
    ORDER BY album;
END $$
DELIMITER ;
