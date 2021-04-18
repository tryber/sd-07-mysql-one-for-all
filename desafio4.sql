CREATE VIEW top_3_artistas AS
SELECT
artists.ARTISTNAME AS artista,
COUNT(*) AS seguidores
FROM
SpotifyClone.artists artists,
SpotifyClone.followers followers
WHERE
artists.ARTIST_ID = followers.ARTIST_ID
GROUP BY followers.ARTIST_ID
ORDER BY seguidores DESC, artista
LIMIT 3;
