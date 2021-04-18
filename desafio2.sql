CREATE VIEW estatisticas_musicais AS
SELECT count(distinct song) AS cancoes,
count(distinct ar.artist) as artistas,
count( distinct al.album) as albuns
FROM SpotifyClone.songs s
INNER JOIN SpotifyClone.albums al ON s.album_id = al.album_id
INNER JOIN SpotifyClone.artists ar ON al.artist_id = ar.artist_id;