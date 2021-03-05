CREATE VIEW historico_reproducao_usuarios AS 
SELECT
u.usuario_name AS `usuario`,
c.cancao_name AS `nome`
FROM SpotifyClone.Usuario AS `u`
INNER JOIN SpotifyClone.HistoricoReproducao AS `h`
ON u.usuario_id = h.usuario_id
INNER JOIN SpotifyClone.Cancao AS `c`
ON c.cancao_id = h.cancao_id
ORDER BY `usuario`, `nome`;
