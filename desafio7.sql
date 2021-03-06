CREATE VIEW perfil_artistas AS
SELECT artista_nome AS artista,
  table_albuns.album_nome AS album,
  COUNT(artista_nome) AS seguidores
FROM SpotifyClone.artistas AS table_artistas
  INNER JOIN SpotifyClone.seguidores AS table_seguidores ON table_artistas.artista_id = table_seguidores.artista_id
  INNER JOIN SpotifyClone.albuns AS table_albuns ON table_artistas.artista_id = table_albuns.artista_id
GROUP BY artista,
  album
ORDER BY seguidores DESC,
  artista ASC;
