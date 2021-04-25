CREATE VIEW estatisticas_musicais AS
SELECT 
COUNT(DISTINCT cancoes.cancao_id)  AS cancoes,
COUNT(DISTINCT artistas.artista_id) AS artistas, 
COUNT(DISTINCT albuns.album_id) AS albuns
FROM SpotifyClone.cancoes
JOIN SpotifyClone.artistas AS artistas
JOIN SpotifyClone.albuns AS albuns;
