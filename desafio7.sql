CREATE VIEW SpotifyClone.perfil_artistas AS
SELECT art.artista AS `artista`,
alb.album AS `album`,
COUNT(sArt.artista) AS `seguidores`
FROM SpotifyClone.artistas AS art
INNER JOIN SpotifyClone.seguindo_artista AS sArt 
ON sArt.artista = art.artista_id
INNER JOIN SpotifyClone.albuns alb 
ON alb.artista_id = art.artista_id
GROUP BY artista, album
ORDER BY seguidores DESC, artista;