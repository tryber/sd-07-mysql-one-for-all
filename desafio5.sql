CREATE VIEW top_2_hits_do_momento AS
  SELECT m.titulo as 'cancao',
  COUNT(h.usuario_id) as 'reproducoes'
  FROM SpotifyClone.musicas AS m
  INNER JOIN SpotifyClone.historiocos AS h
  ON m.musica_id = h.musica_id
  GROUP BY `cancao`
  ORDER BY `reproducoes` desc, `cancao`
  LIMIT 2;
