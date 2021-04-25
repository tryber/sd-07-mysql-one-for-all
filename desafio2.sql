CREATE VIEW SpotifyClone.estatisticas_musicais AS
SELECT COUNT(distinct songs.name) AS cancoes,
COUNT(distinct artists.artist) AS artistas,
COUNT( distinct albums.id) AS albuns
FROM SpotifyClone.songs AS songs
INNER JOIN SpotifyClone.albums AS albums
ON songs.album_id = albums.id
INNER JOIN SpotifyClone.artists AS artists
ON albums.artist_id = artists.id;
