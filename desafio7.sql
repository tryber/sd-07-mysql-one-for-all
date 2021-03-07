CREATE VIEW perfil_artistas AS
  SELECT CONCAT(c.nome, ' ', c.sobreNome) as 'artista',
  a.nome as 'album',
  COUNT(s.usuario_id) as 'seguidores'
  FROM SpotifyClone.cantores AS c
  INNER JOIN SpotifyClone.seguidores AS s
  ON s.cantor_id = c.cantor_id
  INNER JOIN SpotifyClone.albuns AS a
  ON a.cantor_id = c.cantor_id
  GROUP BY `album`, `artista`
  ORDER BY `seguidores` desc, `artista`, `album`;
