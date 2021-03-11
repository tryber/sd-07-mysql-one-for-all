CREATE VIEW top_2_hits_do_momento AS
  SELECT c.cancao AS cancao,
  COUNT(*) AS reproducoes
  FROM SpotifyClone.cancoes c
  INNER JOIN SpotifyClone.historico hist
  ON c.id = hist.cancao_id
  GROUP BY hist.cancao_id
  ORDER BY `reproducoes` DESC, `cancao`
  LIMIT 2;
