CREATE VIEW SpotifyClone.historico_reproducao_usuarios AS
SELECT usuario_nome AS `usuario`,
  musica_nome AS `nome`
FROM SpotifyClone.historico AS h
  JOIN SpotifyClone.usuario AS u ON u.usuario_id = h.usuario_id
  JOIN SpotifyClone.musica AS m ON m.musica_id = h.musica_id
ORDER BY `usuario`,
  `nome`;
