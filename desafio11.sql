CREATE VIEW cancoes_premium AS
SELECT C.titulo_cancao AS nome,
COUNT(H.cancao_id) AS reproducoes
FROM SpotifyClone.cancoes AS C
INNER JOIN SpotifyClone.historico_de_reproducoes AS H
ON H.cancao_id = C.cancao_id
INNER JOIN SpotifyClone.usuarios AS U
ON H.usuario_id = U.usuario_id
WHERE U.plano <> 1
GROUP BY 1
ORDER BY 1;
