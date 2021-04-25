CREATE VIEW estatisticas_musicais AS
SELECT COUNT(DISTINCT(s.song_id)) AS "cancoes",
COUNT(DISTINCT(c.artist_id)) AS "artistas",
COUNT(DISTINCT(a.album_id)) AS "albuns"
FROM SpotifyClone.song AS s
INNER JOIN SpotifyClone.album AS a
ON a.album_id = s.album_id
INNER JOIN SpotifyClone.artist AS c
ON a.artist_id = c.artist_id;
