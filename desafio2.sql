CREATE VIEW estatisticas_musicais AS
SELECT 
COUNT(DISTINCT can.nome) AS "cancoes",
COUNT(DISTINCT art.nome) AS "artistas",
COUNT(DISTINCT alb.nome) AS "albuns"
FROM SpotifyClone.cancoes AS can
INNER JOIN SpotifyClone.artistas AS art
INNER JOIN SpotifyClone.albuns AS alb;
