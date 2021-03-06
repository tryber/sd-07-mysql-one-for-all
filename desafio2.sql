CREATE VIEW estatisticas_musicais AS 
SELECT 
COUNT(DISTINCT can.cancao) AS cancoes, 
COUNT(DISTINCT art.artista) AS artistas, 
COUNT(DISTINCT alb.album) AS albuns 
FROM 
SpotifyClone.albuns AS alb 
INNER JOIN SpotifyClone.cancoes AS can ON can.album_id = alb.album_id
INNER JOIN SpotifyClone.artistas AS art ON alb.artista_id = art.artista_id;
