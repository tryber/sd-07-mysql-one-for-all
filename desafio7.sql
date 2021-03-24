CREATE VIEW perfil_artistas AS
SELECT 
    AR.artist_name AS `artista`,
    AB.album_name AS `album`,
    (SELECT COUNT(*) FROM followers WHERE id_artist = AB.id_artist) AS `seguidores`
FROM albums AB
    INNER JOIN artists AR
    ON AB.id_artist = AR.id_artist
ORDER BY `seguidores` DESC, `artista`;
