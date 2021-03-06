  CREATE VIEW top_3_artistas AS
  SELECT sin.name_singer AS artista, COUNT(f.singer_id) AS seguidores
  FROM SpotifyClone.singers AS sin
  INNER JOIN SpotifyClone.following_artist AS f
  ON f.singer_id = sin.singer_id
  GROUP BY sin.name_singer
  ORDER BY COUNT(f.singer_id) DESC, `artista`
  LIMIT 3;
