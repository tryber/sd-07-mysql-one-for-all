CREATE VIEW historico_reproducao_usuarios AS
SELECT US.nome_usuario AS `usuario`,
M.nome_musica AS `nome`
FROM SpotifyClone.historico AS H
INNER JOIN SpotifyClone.musicas AS M ON M.id_musica = H.id_musica
INNER JOIN SpotifyClone.usuarios AS US ON US.usuario_id = H.usuario_id
ORDER BY `usuario`, `nome`;
