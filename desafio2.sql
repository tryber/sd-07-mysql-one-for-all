CREATE VIEW estatisticas_musicais AS
SELECT COUNT( musics.id) AS "cancoes",
COUNT(DISTINCT artists.id) AS "artistas",
COUNT(DISTINCT album.id) AS "albuns"
FROM spotifyclone.musics AS musics
INNER JOIN spotifyclone.album AS album
ON musics.album_id = album.id
INNER JOIN spotifyclone.artists AS artists
ON album.artist_id = artists.id;
