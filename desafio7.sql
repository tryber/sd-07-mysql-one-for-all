CREATE VIEW perfil_artistas
AS SELECT sin.sin_name AS 'artista',
abl.abl_name AS 'album',
(
  SELECT COUNT(fol.sin_id)
  FROM SpotifyClone.Followings AS fol
  WHERE fol.sin_id = abl.sin_id
)AS 'seguidores'
FROM SpotifyClone.Albums AS abl
INNER JOIN SpotifyClone.Singers AS sin ON sin.sin_id = abl.sin_id
ORDER BY seguidores DESC, artista, album;
