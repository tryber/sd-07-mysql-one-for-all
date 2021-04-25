CREATE VIEW historico_reproducao_usuarios AS
SELECT users.usuario AS usuario,
songs.cancao AS nome
FROM SpotifyClone.historico AS `history`
INNER JOIN SpotifyClone.usuarios AS users
ON history.usuario_id = users.usuario_id
INNER JOIN SpotifyClone.cancoes AS songs
ON history.cancao_id = songs.cancao_id
ORDER BY usuario, nome;
