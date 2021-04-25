CREATE VIEW perfil_artistas AS
SELECT artist.artista AS artista,
albuns.album AS album,
COUNT(albuns.album_id) AS seguidores
FROM SpotifyClone.artistas AS artist
INNER JOIN SpotifyClone.seguindo AS `following`
ON following.artista_id = artist.artista_id
INNER JOIN SpotifyClone.albuns AS albuns
ON artist.artista_id = albuns.artista_id
GROUP BY albuns.album_id
ORDER BY seguidores DESC, artista, album;
