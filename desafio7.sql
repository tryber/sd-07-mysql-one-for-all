CREATE VIEW perfil_artistas AS
  SELECT art.artista AS artista,
  alb.album AS album,
  COUNT(*) AS seguidores
  FROM SpotifyClone.artistas art
  INNER JOIN SpotifyClone.albuns alb ON art.id = alb.artista_id
  INNER JOIN SpotifyClone.seguidores seg ON art.id = seg.artista_id
  GROUP BY seg.artista_id, alb.id
  ORDER BY `seguidores` DESC, `artista`, `album`;
