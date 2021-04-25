CREATE VIEW top_2_hits_do_momento AS
SELECT
  MUSICAS.musica AS "cancao",
  COUNT(HISTORICO.musica_id) AS "reproducoes"
FROM SpotifyClone.historico_de_reproducoes AS HISTORICO
INNER JOIN SpotifyClone.musicas AS MUSICAS
ON MUSICAS.musica_id = HISTORICO.musica_id
GROUP BY 1
ORDER BY 2 DESC, 1
LIMIT 2;
