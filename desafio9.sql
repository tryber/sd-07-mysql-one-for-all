DELIMITER $$
CREATE PROCEDURE albuns_do_artista(IN nameArtista VARCHAR(45))
BEGIN
SELECT
A.name_singer AS 'artista',
AL.name_album AS 'album'
FROM SpotifyClone.artistas A
JOIN SpotifyClone.album AL ON AL.gitartistas_idartistas = A.idartistas
WHERE A.name_singer = nameArtista
ORDER BY AL.name_album;
END $$
