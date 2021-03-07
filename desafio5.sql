CREATE VIEW top_2_hits_do_momento AS
SELECT
mus.nome_musica AS cancao,
COUNT(his.musica_id) as reproducoes
FROM SpotifyClone.musica as mus
INNER JOIN SpotifyClone.historico_reproducao AS his
ON mus.musica_id = his.musica_id
GROUP BY his.musica_id
ORDER BY reproducoes DESC, cancao
LIMIT 2;
