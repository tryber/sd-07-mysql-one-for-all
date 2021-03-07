CREATE VIEW cancoes_premium AS SELECT
C.cancao_nome AS nome,
COUNT(C.cancao_id) AS reproducoes
FROM Cancoes AS C
INNER JOIN Historico_Usuarios AS H
ON C.cancao_id = H.fk_cancao_id
INNER JOIN Usuarios AS U
ON U.usuario_id = H.fk_usuario_id
INNER JOIN Planos AS P
ON P.plano_id = U.fk_plano_id
WHERE P.plano_nome LIKE 'familiar' OR P.plano_nome LIKE 'universitário'
GROUP BY C.cancao_nome
ORDER BY nome ASC;
