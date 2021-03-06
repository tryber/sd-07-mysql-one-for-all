CREATE VIEW top_3_artistas AS
  SELECT CONCAT(c.nome, ' ', c.sobreNome) as 'artista',
  COUNT(s.usuario_id) as 'seguidores'
  FROM SpotifyClone.cantores AS c
  INNER JOIN SpotifyClone.seguidores AS s
  ON s.cantor_id = c.cantor_id
  GROUP BY `artista`
  ORDER BY `seguidores` desc, `artista`
  LIMIT 3;
