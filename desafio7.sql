CREATE VIEW perfil_artistas AS
    SELECT 
        ar.artista_nome AS artista,
        a.album_nome AS album,
        COUNT(s.usuario_id) AS seguidores
    FROM
        SpotifyClone.album AS a
            JOIN
        SpotifyClone.artista AS ar ON a.artista_id = ar.artista_id
            JOIN
        SpotifyClone.seguindo_artista AS s ON a.artista_id = s.artista_id
        GROUP BY artista, album
        ORDER BY seguidores DESC, artista, album;
