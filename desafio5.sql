CREATE VIEW top_2_hits_do_momento AS
SELECT C.titulo_cancao AS cancao,
COUNT(H.cancao_id) AS reproducoes
FROM SpotifyClone.cancoes AS C
INNER JOIN SpotifyClone.historico_de_reproducoes AS H
ON H.cancao_id = C.cancao_id
GROUP BY H.cancao_id
ORDER BY 2 DESC, 1
LIMIT 2;
