CREATE VIEW estatisticas_musicais AS 
SELECT COUNT(S.song_id)AS cancoes,
COUNT(ART.artist_id) AS artistas,
COUNT(ALB.album_id) AS albuns
FROM SpotifyClone.songs AS S
JOIN SpotifyClone.artists AS ART
JOIN SpotifyClone.albums AS ALB;
