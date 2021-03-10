CREATE VIEW estatisticas_musicais AS
SELECT COUNT(DISTINCT C.cancao_id) AS cancoes,
COUNT(DISTINCT A.artista_id) AS artistas,
COUNT(DISTINCT AL.album_id) AS albuns
FROM SpotifyClone.cancoes AS C,
SpotifyClone.artistas AS A,
SpotifyClone.albuns AS AL;
