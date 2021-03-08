CREATE VIEW estatisticas_musicais AS 
SELECT 
COUNT(DISTINCT can.cancao) AS cancoes, 
COUNT(DISTINCT art.artista_id) AS artistas, 
COUNT(DISTINCT alb.album_id) AS albuns 
FROM 
SpotifyClone.cancoes AS can
INNER JOIN SpotifyClone.artistas AS art ON art.artista_id = can.artista_id
INNER JOIN SpotifyClone.albuns AS alb ON alb.artista_id = can.artista_id;
