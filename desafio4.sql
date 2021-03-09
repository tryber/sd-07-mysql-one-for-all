CREATE VIEW top_3_artistas AS
    SELECT 
        art.nome AS artista, COUNT(usuario.id) AS seguidores
    FROM
        SpotifyClone.Seguindo AS seguindo
            INNER JOIN
        SpotifyClone.Usuario AS usuario ON seguindo.usuario_id = usuario.id
            INNER JOIN
        SpotifyClone.Artista AS art ON seguindo.artista_id = artista.id
    GROUP BY artista
    ORDER BY seguidores DESC , artista
    LIMIT 3;
