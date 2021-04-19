CREATE VIEW historico_reproducao_usuarios AS
SELECT U.usuario_nome AS usuario,
M.musica AS nome
FROM SpotifyClone.usuarios AS U
INNER JOIN SpotifyClone.historico AS H
ON U.usuario_id = H.usuario_id
INNER JOIN SpotifyClone.musicas AS M
ON H.musica_id = M.musica_id
ORDER BY 1, 2;
