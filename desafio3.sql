CREATE VIEW SpotifyClone.historico_reproducao_usuarios AS
SELECT users.usuario AS usuario,
songs.cancoes AS nome
FROM SpotifyClone.users
INNER JOIN SpotifyClone.historico
ON historico.usuario_id = users.usuario_id
INNER JOIN SpotifyClone.songs
ON songs.cancoes_id = historico.cancoes_id
ORDER BY 1 asc, 2 asc;
