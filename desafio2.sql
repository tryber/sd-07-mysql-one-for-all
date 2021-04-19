CREATE VIEW estatisticas_musicais AS
SELECT DISTINCT
COUNT(t1.cancao_id) AS 'cancoes',
COUNT(DISTINCT t3.artista_id) AS 'artistas',
COUNT(DISTINCT t2.album_id) AS 'albuns'
FROM
SpotifyClone.cancoes AS t1
INNER JOIN
SpotifyClone.album AS t2 ON t1.album_id = t2.album_id
INNER JOIN
SpotifyClone.artistas AS t3 ON t2.artista_id = t3.artista_id;
