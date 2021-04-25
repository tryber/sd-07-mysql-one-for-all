CREATE VIEW perfil_artistas AS
SELECT
AR.artist_name AS artista,
AL.album_name AS album,
COUNT(*) AS seguidores
FROM
Artist_Album AS AA
JOIN Artist AS AR ON AA.artist_ID = AR.artist_ID
JOIN Album AS AL ON AA.album_ID = AL.album_ID
JOIN User_Artist AS UA ON AA.artist_ID = UA.artist_ID
GROUP BY
artista,
album
ORDER BY
seguidores DESC,
artista,
album;
