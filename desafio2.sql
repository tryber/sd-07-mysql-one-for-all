CREATE VIEW estatisticas_musicais AS 
SELECT COUNT(distinct A.id) AS 'cancoes', 
COUNT(distinct C.id) AS 'artistas',
COUNT(distinct B.id) AS 'albuns' FROM SpotifyClone.song AS A
INNER JOIN SpotifyClone.album AS B
ON A.album_id = B.id
INNER JOIN SpotifyClone.artist AS C
ON B.artist_id = C.id;
