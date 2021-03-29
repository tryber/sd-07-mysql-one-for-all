CREATE VIEW perfil_artistas AS
SELECT A.artista AS artista,
AL.titulo_album AS album,
COUNT(AL.album_id) AS seguidores
FROM SpotifyClone.albuns AS AL
INNER JOIN SpotifyClone.artistas AS A
ON A.artista_id = AL.artista_id
INNER JOIN SpotifyClone.seguindo_artistas AS S
ON AL.artista_id = S.artista_id
GROUP BY AL.album_id
ORDER BY 3 DESC, 1, 2;
