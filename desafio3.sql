CREATE VIEW historico_reproducao_usuarios AS
  SELECT u.nomeUsuario as 'usuario',
  m.titulo as 'nome'
  FROM SpotifyClone.usuarios AS u
  INNER JOIN SpotifyClone.historiocos AS h
  ON h.usuario_id = u.usuario_id
  INNER JOIN SpotifyClone.musicas AS m
  ON h.musica_id = m.musica_id
  ORDER BY `usuario`, `nome`;