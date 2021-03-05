CREATE VIEW estatisticas_musicais AS
SELECT
COUNT(c.cancao_id) AS cancoes,
(
SELECT
COUNT(a.artista_id)
FROM artista a
) AS artistas,
(
SELECT
COUNT(al.album_id)
FROM album al
) AS albuns
FROM cancao c;
