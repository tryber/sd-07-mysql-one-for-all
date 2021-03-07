CREATE VIEW cancoes_premium AS
SELECT can.cancao AS `nome`,
COUNT(hRep.usuario_id) AS `reproducoes`
FROM SpotifyClone.cancoes AS can
INNER JOIN SpotifyClone.historico_de_reproducoes AS hRep
ON hRep.cancao_id = can.cancao_id
INNER JOIN SpotifyClone.usuarios AS usr
ON hRep.usuario_id = usr.usuario_id
WHERE hRep.cancao_id = can.cancao_id 
AND usr.plano_id BETWEEN 2 AND 3
GROUP BY nome
ORDER BY nome;