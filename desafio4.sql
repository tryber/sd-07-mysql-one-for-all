CREATE VIEW top_3_artistas AS
SELECT dba.artista AS 'artista',
COUNT(dbf.artista_id) as 'seguidores'
FROM SpotifyClone.artists as dba
INNER JOIN seguindo_artistas as dbf
ON dbf.artista_id = dba.artista_id
GROUP BY `artista`
ORDER BY `seguidores` DESC, `artista` ASC
LIMIT 3;
