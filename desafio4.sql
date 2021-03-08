CREATE VIEW top_3_artistas AS
    SELECT 
        t1.nome AS artista, COUNT(t2.artista_id) AS seguidores
    FROM
        SpotifyClone.artista AS t1
            INNER JOIN
        SpotifyClone.seguindo_artistas AS t2 ON t1.artista_id = t2.artista_id
    GROUP BY artista
    ORDER BY seguidores DESC , artista ASC
    LIMIT 3;
