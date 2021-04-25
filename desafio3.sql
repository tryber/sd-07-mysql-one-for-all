CREATE VIEW historico_reproducao_usuarios AS
SELECT U.usuario_nome AS usuario,
M.nome AS nome
FROM SpotifyClone.usuarios U
INNER JOIN SpotifyClone.historico H
ON U.usuario_id = H.usuario_id
INNER JOIN SpotifyClone.musicas M
ON H.musica_id = M.musica_id
ORDER BY 1, 2;
