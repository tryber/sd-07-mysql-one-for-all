CREATE VIEW top_2_hits_do_momento AS
SELECT
songs.SONG AS cancao,
COUNT(*) AS reproducoes
FROM
spotifyclone.`history` `history`,
spotifyclone.songs songs
WHERE
`history`.SONG_ID = songs.SONG_ID
GROUP BY `history`.SONG_ID
ORDER BY reproducoes DESC, cancao
LIMIT 2;
