CREATE VIEW spotifyclone.estatisticas_musicais AS
SELECT
COUNT(DISTINCT songs.SONG_ID) AS cancoes,
COUNT(DISTINCT artists.ARTIST_ID) AS artistas,
COUNT(DISTINCT albums.ALBUM_ID) AS albuns
FROM
spotifyclone.songs songs,
spotifyclone.artists artists,
spotifyclone.albums albums;
  