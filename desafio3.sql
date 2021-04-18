CREATE VIEW SpotifyClone.historico_reproducao_usuarios AS
SELECT `nome_usuario` AS `usuario`,
  `nome_musica` AS `nome`
FROM SpotifyClone.historico_reproducao AS h
  INNER JOIN SpotifyClone.usuarios AS u ON h.usuario_id = u.usuario_id
  JOIN SpotifyClone.musicas AS m ON h.musica_id = m.musica_id
ORDER BY `usuario`,
  `nome`;
