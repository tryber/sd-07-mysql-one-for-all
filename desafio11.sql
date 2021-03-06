CREATE VIEW cancoes_premium AS
SELECT 
cancoes.cancao AS nome,
COUNT(historico_reproducoes.cancoes_id) AS reproducoes
FROM SpotifyClone.historico_reproducoes AS historico_reproducoes
INNER JOIN SpotifyClone.cancoes AS cancoes
ON historico_reproducoes.cancoes_id = cancoes.cancoes_id
INNER JOIN SpotifyClone.users AS users
ON historico_reproducoes.usuario_id = users.usuario_id
INNER JOIN SpotifyClone.planos AS planos
ON users.plano_id = planos.plano_id
WHERE planos.plano <> 'gratuito'
GROUP BY historico_reproducoes.cancoes_id
ORDER BY nome;
