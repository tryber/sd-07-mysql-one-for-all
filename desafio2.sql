CREATE VIEW estatisticas_musicais AS
SELECT
COUNT(m.musica_id) AS cancoes,
COUNT(ar.artista_id) AS artistas,
COUNT(a.album_id) AS album
FROM
SpotifyClone.musica AS m
INNER JOIN SpotifyClone.album AS a ON m.album_id = a.album_id
INNER JOIN SpotifyClone.artista AS ar ON a.artista_id = ar.artista_id;
