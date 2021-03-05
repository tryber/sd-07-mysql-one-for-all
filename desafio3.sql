CREATE VIEW historico_reproducao_usuarios AS 
SELECT u.nome_usuario AS usuario, m.nome_musica AS nome
FROM SpotifyClone.usuarios AS u
INNER JOIN SpotifyClone.historico_usuario AS h
ON u.id = h.usuario_id
INNER JOIN SpotifyClone.musicas AS m
ON m.id = h.musica_id
ORDER BY usuario , nome;
