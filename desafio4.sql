CREATE VIEW top_3_artistas AS
    SELECT 
        a.artista_nome AS artista, COUNT(s.usuario_id) AS seguidores
    FROM
        SpotifyClone.seguindo_artista AS s
            JOIN
        SpotifyClone.artista AS a ON s.artista_id = a.artista_id
    GROUP BY artista
    ORDER BY seguidores DESC , artista
    LIMIT 3;
