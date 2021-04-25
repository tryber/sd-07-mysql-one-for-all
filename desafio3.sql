CREATE VIEW historico_reproducao_usuarios AS
SELECT
us.user_name AS 'usuario',
s.music_name AS 'nome'
FROM SpotifyClone.users AS us
INNER JOIN SpotifyClone.music_history AS mh ON us.id = mh.user_id
INNER JOIN SpotifyClone.musics AS s ON mh.music_id = s.id
ORDER BY us.user_name ASC, s.music_name ASC;
