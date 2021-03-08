CREATE VIEW historico_reproducao_usuarios AS SELECT
U.usuario AS `usuario`,
C.cancao AS `nome`
FROM SpotifyClone.usuarios AS U
INNER JOIN SpotifyClone.historico AS H ON U.usuario_id = H.usuario_id
INNER JOIN SpotifyClone.cancoes AS C ON C.cancao_id = H.cancao_id
ORDER BY `usuario`, `nome`;
