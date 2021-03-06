CREATE VIEW perfil_artistas AS  
  SELECT Art.artist_name AS artista, Album.album_name AS album, C.Qt AS seguidores
  FROM SpotifyClone.Artists AS Art
  INNER JOIN SpotifyClone.Album AS Album
  ON Art.artist_id = Album.artist_id
  INNER JOIN(
  SELECT Art.artist_id, COUNT(F.artist_id) AS Qt FROM
  SpotifyClone.Artists AS Art
  INNER JOIN SpotifyClone.Following AS F
  ON Art.artist_id = F.artist_id
  GROUP BY Art.artist_id) AS C
  ON Art.artist_id = C.artist_id
  ORDER BY seguidores DESC, artista, album;
