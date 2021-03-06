CREATE VIEW top_2_hits_do_momento AS
SELECT cancoes_nome AS cancao,
  COUNT(cancoes_nome) AS reproducoes
FROM SpotifyClone.cancoes AS table_cancoes
  INNER JOIN SpotifyClone.historico AS table_historico ON table_cancoes.cancao_id = table_historico.cancao_id
GROUP BY cancao
ORDER BY reproducoes DESC,
  cancao ASC
LIMIT 2;
