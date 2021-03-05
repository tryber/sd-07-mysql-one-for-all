DELIMITER $$

CREATE PROCEDURE albuns_do_artista(IN artist_name VARCHAR(50)) BEGIN
SELECT
AR.artist_name AS artista,
AL.album_name AS album
FROM
Artist AS AR
JOIN Artist_Album AS AA ON AR.artist_ID = AA.artist_ID
JOIN Album AS AL ON AL.album_ID = AA.album_ID
WHERE
AR.artist_name = artist_name
ORDER BY
album;
END $$

DELIMITER;
