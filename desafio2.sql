CREATE VIEW estatisticas_musicais AS 
SELECT COUNT(DISTINCT S.song_id)AS cancoes,
COUNT(DISTINCT ART.artist_id) AS artistas,
COUNT(DISTINCT ALB.album_id) AS albuns
FROM SpotifyClone.songs AS S
JOIN SpotifyClone.artists AS ART
JOIN SpotifyClone.albums AS ALB;
