CREATE VIEW top_2_hits_do_momento AS
SELECT
songs.SONGNAME AS cancao,
COUNT(*) AS reproducoes
FROM
SpotifyClone.musichistory musichistory,
SpotifyClone.songs songs
WHERE
musichistory.SONG_ID = songs.SONG_ID
GROUP BY musichistory.SONG_ID
ORDER BY reproducoes DESC, cancao
LIMIT 2;
