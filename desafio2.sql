SELECT
COUNT(*) 'cancoes',
(SELECT COUNT(*) FROM SpotifyClone.artists) 'artistas',
(SELECT COUNT(*) FROM SpotifyClone.albums) 'albuns'
FROM SpotifyClone.songs;
