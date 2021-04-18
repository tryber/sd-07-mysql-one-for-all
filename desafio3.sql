CREATE VIEW historico_reproducao_usuarios AS
SELECT
users.`USER` AS usuario,
songs.SONG AS nome
FROM
spotifyclone.`history` `history`,
spotifyclone.songs songs,
spotifyclone.users users
WHERE
`history`.USER_ID = users.USER_ID
AND `history`.SONG_ID = songs.SONG_ID
ORDER BY usuario, nome;
