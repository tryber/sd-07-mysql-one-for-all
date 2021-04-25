CREATE VIEW perfil_artistas AS
    SELECT 
        art.nome AS artista,
        alb.nome AS album,
        COUNT(seguindo.usuario_id) AS seguidores
    FROM
        SpotifyClone.Artista AS art
            INNER JOIN
        SpotifyClone.Album AS alb ON art.id = alb.artista_id
            INNER JOIN
        SpotifyClone.Seguindo AS seguindo ON art.id = seguindo.artista_id
    GROUP BY artista , album
    ORDER BY seguidores DESC , artista , album;  
