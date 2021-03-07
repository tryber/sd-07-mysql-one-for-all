CREATE VIEW cancoes_premium AS 
SELECT c.cancao AS nome, COUNT(hr.cancao_id) AS reproducoes
FROM SpotifyClone.cancoes AS c 
INNER JOIN SpotifyClone.historico_de_reproducoes AS hr ON c.cancao_id = hr.cancao_id
INNER JOIN SpotifyClone.usuarios AS u ON hr.usuario_id = u.usuario_id
WHERE u.plano_id <> 1
GROUP BY c.cancao ORDER BY c.cancao;
