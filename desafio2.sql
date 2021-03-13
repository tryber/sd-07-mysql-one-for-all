CREATE VIEW estatisticas_musicais AS
SELECT COUNT(DISTINCT can.cancao_id) AS "cancoes",
COUNT(DISTINCT art.artista_name) AS "artistas",
COUNT(DISTINCT alb.album_id) AS "albuns"
FROM SpotifyClone.cancoes AS can
INNER JOIN SpotifyClone.artistas AS art
ON can.artista_id = art.artista_id
INNER JOIN SpotifyClone.albuns AS alb
ON can.artista_id = alb.artista_id;

SELECT * FROM estatisticas_musicais;
