CREATE VIEW historico_reproducao_usuarios AS 
SELECT u.nome_usuario AS usuario, m.nome_musica AS nome
FROM SpotifyClone.usuarios AS u
JOIN SpotifyClone.historico_usuario AS h
ON h.usuario_id = u.id
JOIN SpotifyClone.musicas AS m
ON h.musica_id = m.id
ORDER BY u.nome_usuario , m.nome_musica;
