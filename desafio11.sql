CREATE VIEW SpotifyClone.cancoes_premium AS
SELECT cancao.cancao AS `nome`,
COUNT(hist.cancao_id) AS `reproducoes`
FROM SpotifyClone.cancao AS cancao
INNER JOIN SpotifyClone.historico_reproducoes AS hist
ON cancao.cancao_id = hist.cancao_id
INNER JOIN SpotifyClone.usuario AS usuario
ON hist.usuario_id = usuario.usuario_id
WHERE usuario.plano_id BETWEEN 2 AND 3
GROUP BY nome
ORDER BY nome;
