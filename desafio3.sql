CREATE VIEW historico_reproducao_usuarios AS 
SELECT u.nome "usuario", c.nome "nome" FROM SpotifyClone.hist_reproducoes AS hr
INNER JOIN SpotifyClone.usuarios AS u ON u.usuario_id = hr.usuario_id
INNER JOIN SpotifyClone.cancoes AS c ON c.cancao_id = hr.cancao_id
ORDER BY `usuario`, `nome`;