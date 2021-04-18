CREATE VIEW SpotifyClone.cancoes_premium AS
SELECT m.`nome_musica` AS `nome`,
  COUNT(h.`musica_id`) AS `reproducoes`
FROM SpotifyClone.historico_reproducao AS h
  INNER JOIN SpotifyClone.musicas AS m ON m.`musica_id` = h.`musica_id`
  JOIN SpotifyClone.usuarios AS u ON u.`usuario_id` = h.`usuario_id`
WHERE u.plano_id = 2
  or u.plano_id = 3
GROUP BY h.`musica_id`
ORDER BY `nome`;
