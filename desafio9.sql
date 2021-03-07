USE SpotifyClone;
DELIMITER $$
CREATE PROCEDURE albuns_do_artista(IN entrada_artista VARCHAR(100))
BEGIN
    SELECT a.artista AS a, ab.album AS album
    FROM artistas AS a
    INNER JOIN albuns AS ab ON a.artista = entrada_artista AND a.artista_id = ab.artista_id;
END $$
DELIMITER ;
