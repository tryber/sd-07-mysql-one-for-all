CREATE VIEW SpotifyClone.estatisticas_musicais AS
SELECT
COUNT(DISTINCT(can.cancao)) AS 'cancoes',
COUNT(DISTINCT(art.artista)) AS 'artistas',
COUNT(DISTINCT(alb.album)) AS 'albuns'
FROM SpotifyClone.cancoes AS can, 
SpotifyClone.artistas AS art, 
SpotifyClone.albuns AS alb;