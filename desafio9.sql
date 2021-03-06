DELIMITER $$
CREATE PROCEDURE albuns_do_artista(IN name VARCHAR(100))
BEGIN
SELECT s.name_singer AS artista, a.name_album AS album
FROM SpotifyClone.singers AS s
INNER JOIN SpotifyClone.album AS a
ON a.singer_id = s.singer_id
WHERE s.name_singer = name
ORDER BY `album`;
END $$
DELIMITER ;
