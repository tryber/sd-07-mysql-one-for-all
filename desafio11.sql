CREATE VIEW cancoes_premium AS
SELECT 
can.nome AS nome,
COUNT(his.cancao_id) AS reproducoes
FROM SpotifyClone.cancoes AS can
INNER JOIN SpotifyClone.historico_de_reproducoes AS his
ON his.cancao_id = can.cancao_id
INNER JOIN SpotifyClone.usuarios AS usr
ON usr.plano_id IN (2,3) AND usr.usuario_id = his.usuario_id
GROUP BY his.cancao_id
ORDER BY nome;
