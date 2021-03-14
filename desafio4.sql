CREATE VIEW top_3_artistas AS
    SELECT 
        a.artista_nome AS artista, COUNT(s.usuario_id) AS seguidores
    FROM
        spotifyclone.seguindo_artista AS s
            JOIN
        spotifyclone.artista AS a ON s.artista_id = a.artista_id
    GROUP BY artista
    ORDER BY seguidores DESC , artista
    LIMIT 3;
