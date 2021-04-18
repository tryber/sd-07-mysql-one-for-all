CREATE VIEW SpotifyClone.top_2_hits_do_momento AS
SELECT m.`nome_musica` AS `cancao`,
  COUNT(h.`musica_id`) AS `reproducoes`
FROM SpotifyClone.historico_reproducao AS h
  INNER JOIN SpotifyClone.musicas AS m ON m.`musica_id` = h.`musica_id`
GROUP BY h.`musica_id`
ORDER BY `reproducoes` DESC,
  `cancao`
LIMIT 2;
