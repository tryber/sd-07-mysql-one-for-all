CREATE VIEW SpotifyClone.perfil_artistas AS
SELECT artistas.artista AS artista,
albuns.album AS album, 
COUNT(*) AS seguidores
FROM SpotifyClone.artistas
INNER JOIN SpotifyClone.seguindo
ON seguindo.artista_id = artistas.artista_id
INNER JOIN SpotifyClone.albuns
ON artistas.artista_id = albuns.artista_id
GROUP BY albuns.album_id
ORDER BY 3 desc, 1 asc, 2 asc;
