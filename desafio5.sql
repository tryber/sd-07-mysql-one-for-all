CREATE VIEW top_2_hits_do_momento AS
SELECT c.nome AS cancao,
COUNT(hr.id_usuario) reproducoes
FROM SpotifyClone.tabela_historico_reproducao hr
INNER JOIN SpotifyClone.tabela_cancoes c
ON hr.id_cancao = c.id_cancao
GROUP BY hr.id_cancao
ORDER BY reproducoes DESC, cancao
LIMIT 2;
