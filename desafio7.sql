CREATE VIEW perfil_artistas AS
    SELECT 
        artista, album, COUNT(*) AS 'seguidores'
    FROM
        albuns a
            INNER JOIN
        seguindo s ON a.artista = s.seguindo_artistas
    GROUP BY album , artista
    ORDER BY COUNT(*) DESC , artista , album;
