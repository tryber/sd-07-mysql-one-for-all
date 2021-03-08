CREATE VIEW `cancoes_premium` AS SELECT
C.cancao AS `nome`,
COUNT(C.cancao_id) AS `reproducoes`
FROM SpotifyClone.cancoes AS C
INNER JOIN SpotifyClone.historico AS H ON C.cancao_id = H.cancao_id
INNER JOIN SpotifyClone.usuarios AS U ON U.usuario_id = H.usuario_id
INNER JOIN SpotifyClone.planos AS P ON P.id_plano = U.id_plano
WHERE P.plano LIKE 'familiar' OR P.plano LIKE 'universitário'
GROUP BY C.cancao_id
ORDER BY `nome` ASC;
