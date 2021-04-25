CREATE VIEW estatisticas_musicais AS
SELECT COUNT( musics.id) AS "cancoes",
COUNT(DISTINCT artists.id) AS "artistas",
COUNT(DISTINCT album.id) AS "albuns"
FROM SpotifyClone.musics AS musics
INNER JOIN SpotifyClone.album AS album
ON musics.album_id = album.id
INNER JOIN SpotifyClone.artists AS artists
ON album.artist_id = artists.id;
