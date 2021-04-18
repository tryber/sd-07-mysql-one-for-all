CREATE VIEW SpotifyClone.estatisticas_musicais AS
SELECT
COUNT(DISTINCT songs.SONG_ID) AS cancoes,
COUNT(DISTINCT artists.ARTIST_ID) AS artistas,
COUNT(DISTINCT albums.ALBUM_ID) AS albuns
FROM
SpotifyClone.songs songs,
SpotifyClone.artists artists,
SpotifyClone.albums albums;
