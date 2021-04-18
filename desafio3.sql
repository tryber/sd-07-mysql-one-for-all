CREATE VIEW historico_reproducao_usuarios AS
SELECT
users.USERNAME AS usuario,
songs.SONGNAME AS nome
FROM
SpotifyClone.musichistory musichistory,
SpotifyClone.songs songs,
SpotifyClone.users users
WHERE
musichistory.USER_ID = users.USER_ID
AND musichistory.SONG_ID = songs.SONG_ID
ORDER BY usuario, nome;
