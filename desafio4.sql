CREATE VIEW top_3_artistas AS
  SELECT art.artista AS 'artista',
  COUNT(*) AS 'seguidores'
  FROM SpotifyClone.artistas art
  INNER JOIN SpotifyClone.seguidores seg ON seg.artista_id = art.id
  GROUP BY seg.artista_id
  ORDER BY `seguidores` DESC, `artista`
  LIMIT 3;
