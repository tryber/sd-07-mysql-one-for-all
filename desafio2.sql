CREATE VIEW estatisticas_musicais AS
SELECT
(SELECT COUNT(M.musica_id)
FROM musicas AS M) AS cancoes,
(SELECT COUNT(A.artista_id)
FROM artistas AS A) AS artistas,
(SELECT COUNT(ALB.album_id)
FROM albuns AS ALB) AS albuns
