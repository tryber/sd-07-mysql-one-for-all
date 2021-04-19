CREATE VIEW SpotifyClone.cancoes_premium AS
SELECT
t1.title AS nome,
COUNT(t2.cancao_id) AS reproducoes
FROM SpotifyClone.Cancao AS t1
INNER JOIN SpotifyClone.HistoricoReproducao AS t2 ON t2.cancao_id = t1.id
INNER JOIN SpotifyClone.Usuario AS t3 ON t2.usuario_id = t3.id
INNER JOIN SpotifyClone.Plano AS t4 ON t4.id = t3.plano_id
WHERE t4.descricao IN ('familiar', 'universitário')
GROUP BY t1.title
ORDER BY nome;
