CREATE VIEW estatisticas_musicais AS
SELECT
COUNT(c.id) AS cancoes,
(
SELECT
COUNT(a.id)
FROM spotifyclone.artista a
) AS artistas,
(
SELECT
COUNT(al.id)
FROM spotifyclone.album al
) AS albuns
FROM spotifyclone.cancao c;
