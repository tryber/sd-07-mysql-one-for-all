CREATE VIEW estatisticas_musicais AS
SELECT COUNT(son.songs_id) AS cancoes,
COUNT(DISTINCT art.artist_id) AS artistas,
COUNT(DISTINCT alb.album_id) AS albuns
FROM SpotifyClone.songs AS son
INNER JOIN SpotifyClone.albums AS alb
ON son.album_id = alb.album_id
INNER JOIN SpotifyClone.artists AS art
ON art.artist_id = alb.artist_id;