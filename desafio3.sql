USE SpotifyClone;

CREATE VIEW historico_reproducao_usuarios AS
  SELECT u.usuario AS 'usuario',
  c.cancao AS 'nome'
  FROM usuarios u
  INNER JOIN historico hist ON hist.usuario_id = u.id
  INNER JOIN cancoes c ON c.id = hist.cancao_id
  ORDER BY `usuario`, `nome`;
