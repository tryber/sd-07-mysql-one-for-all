CREATE  VIEW cancoes_premium AS
SELECT c.nome "nome", COUNT(hc.cancao_id) "reproducoes" FROM SpotifyClone.cancoes AS c
INNER JOIN SpotifyClone.hist_reproducoes AS hc ON hc.cancao_id = c.cancao_id
INNER JOIN SpotifyClone.usuarios as u  ON u.usuario_id = hc.usuario_id
WHERE hc.usuario_id = 2 OR hc.usuario_id = 3
GROUP BY c.nome
ORDER BY `nome`;