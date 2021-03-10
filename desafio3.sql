CREATE VIEW historico_reproducao_usuarios AS
SELECT users.user_name AS "usuario",
musics.title AS "nome"
FROM spotifyclone.users AS users
INNER JOIN spotifyclone.music_history AS music_history
ON music_history.user_id = users.id
INNER JOIN spotifyclone.musics AS musics
ON music_history.music_id = musics.id
ORDER BY users.user_name, musics.title;
