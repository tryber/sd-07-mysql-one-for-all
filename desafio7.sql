CREATE VIEW SpotifyClone.perfil_artistas AS 
SELECT art.artista_nome AS "artista",
alb.album_nome AS "album",
COUNT(alb.album_id) AS "seguidores"
FROM SpotifyClone.artistas AS art
INNER JOIN SpotifyClone.albuns AS alb
ON alb.artista_id = art.artista_id
INNER JOIN SpotifyClone.seguindo AS seg
ON seg.artista_id = art.artista_id
GROUP BY alb.album_id
ORDER BY 3 DESC , 1 , 2;
