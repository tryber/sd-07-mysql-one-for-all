CREATE VIEW top_2_hits_do_momento AS
SELECT m.nome_musica AS cancao,
count(hu.musica_id) AS reproducoes
FROM SpotifyClone.historico_usuario AS hu
INNER JOIN SpotifyClone.musicas AS m
ON m.id = hu.musica_id
GROUP BY hu.musica_id
ORDER BY reproducoes DESC,cancao
LIMIT 2;
