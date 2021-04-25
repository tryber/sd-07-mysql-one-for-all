CREATE VIEW historico_reproducao_usuarios
AS SELECT U.nome as `usuario`, C.nome AS `nome`
FROM SpotifyClone.usuarios_cancoes AS UC
INNER JOIN SpotifyClone.cancoes AS C ON UC.cancao_id = C.cancao_id
INNER JOIN SpotifyClone.usuarios AS U ON UC.usuario_id = U.usuario_id
ORDER BY `usuario`, `nome`;
