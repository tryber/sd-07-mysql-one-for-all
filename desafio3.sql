CREATE VIEW historico_reproducao_usuarios AS
SELECT 
usr.nome AS `usuario`,
can.nome AS `nome`
FROM SpotifyClone.usuarios AS usr
INNER JOIN SpotifyClone.historico_de_reproducoes AS hr
ON usr.usuario_id = hr.usuario_id
INNER JOIN SpotifyClone.cancoes as can
ON can.cancao_id = hr.cancao_id
ORDER BY `usuario`, `nome`;
