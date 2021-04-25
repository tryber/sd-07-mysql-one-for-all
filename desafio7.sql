CREATE VIEW perfil_artistas AS
SELECT
A.artista AS artista,
AL.album AS album,
COUNT(S.artista_id) AS seguidores
FROM SpotifyClone.artistas AS A
INNER JOIN SpotifyClone.albuns AS AL
ON AL.artista_id = A.artista_id
INNER JOIN SpotifyClone.seguindo AS S
ON S.artista_id = A.artista_id
GROUP BY AL.album, A.artista
ORDER BY seguidores DESC, A.artista, AL.album;
