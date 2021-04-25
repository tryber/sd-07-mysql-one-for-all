CREATE VIEW historico_reproducao_usuarios AS
SELECT
s.nome_musica AS nome,
u.nome_usuario AS usuario
FROM SpotifyClone.reproductions AS r
INNER JOIN
SpotifyClone.users AS u
ON r.usuario_id = u.usuario_id
INNER JOIN
SpotifyClone.songs AS s
ON r.musica_id = s.musica_id
ORDER BY 2, 1;
