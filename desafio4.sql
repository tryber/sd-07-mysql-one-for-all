CREATE VIEW top_3_artistas AS
SELECT
AR.artist_name AS artista,
count(*) AS seguidores
FROM
User_Artist AS UA
JOIN Artist as AR ON UA.artist_ID = AR.artist_ID
GROUP BY
artista
ORDER BY
seguidores DESC,
artista
LIMIT
3;
