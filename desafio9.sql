DELIMITER $$
CREATE PROCEDURE SpotifyClone.albuns_do_artista(IN artista_name VARCHAR(100))
BEGIN
SELECT
t1.nome AS 'artista',
t2.album AS 'album'
FROM SpotifyClone.artistas t1
INNER JOIN SpotifyClone.album t2 ON t2.artista_id = t1.artista_id
WHERE t1.nome = artista_name
ORDER BY t2.album;
END;
$$ DELIMITER ;
