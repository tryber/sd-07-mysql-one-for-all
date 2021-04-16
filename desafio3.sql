CREATE VIEW historico_reproducao_usuarios AS
  SELECT u.usuario AS usuario,
  c.cancao AS nome
  FROM SpotifyClone.usuarios u
  INNER JOIN SpotifyClone.historico hist ON hist.usuario_id = u.id
  INNER JOIN SpotifyClone.cancoes c ON c.id = hist.cancao_id
  ORDER BY `usuario`, `nome`;
