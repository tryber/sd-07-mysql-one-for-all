CREATE VIEW estatisticas_musicais AS
SELECT count(DISTINCT Song.song_ID) AS 'cancoes',
  count(DISTINCT Artist.artist_ID) AS 'artistas',
  count(DISTINCT Album.album_ID) AS 'albuns'
FROM SpotifyClone.Song AS Song
  JOIN SpotifyClone.Artist AS Artist
  JOIN SpotifyClone.Album AS Album;
