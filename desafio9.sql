USE SpotifyClone;
DELIMITER $$
CREATE PROCEDURE albuns_do_artista(IN nome_artista VARCHAR(100))
BEGIN
SELECT artista, album FROM albuns
WHERE artista = nome_artista
ORDER BY album;
END $$
DELIMITER ;
