CREATE VIEW top_3_artistas AS
  SELECT A.artist_name AS artista, COUNT(F.artist_id) as seguidores
  FROM SpotifyClone.Artists AS A
  INNER JOIN SpotifyClone.Following AS F
  ON A.artist_id = F.artist_id
  GROUP BY A.artist_name
  ORDER BY seguidores DESC, artista
  LIMIT 3;