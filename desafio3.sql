CREATE VIEW historico_reproducao_usuarios AS
SELECT us.name AS 'usuario',
song.name AS 'nome'
FROM SpotifyClone.user as us
INNER JOIN SpotifyClone.music_play_history as plh
ON us.id = plh.user_id
INNER JOIN SpotifyClone.songs AS song
ON song.id = plh.song_id
ORDER BY 1, 2;
