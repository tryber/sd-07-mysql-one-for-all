CREATE VIEW cancoes_premium AS
SELECT
C.cancao AS 'nome',
COUNT(H.usuario_id) AS 'reproducoes'
FROM SpotifyClone.cancoes AS C
INNER JOIN SpotifyClone.historico AS H
ON C.cancao_id = H.cancao_id
INNER JOIN SpotifyClone.usuarios AS U
ON U.usuario_id = H.usuario_id
WHERE U.plano_id > 1
GROUP BY C.cancao
ORDER BY C.cancao;
