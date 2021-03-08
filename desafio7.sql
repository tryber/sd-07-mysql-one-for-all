CREATE VIEW perfil_artistas AS
    SELECT 
        a.artista AS 'artista',
        a2.album AS 'album',
        COUNT(s.artista_id) AS 'seguidores'
    FROM
        SpotifyClone.artistas AS a
            INNER JOIN
        SpotifyClone.albuns AS a2 ON a.artista_id = a2.artista_id
            INNER JOIN
        SpotifyClone.seguindo AS s ON a.artista_id = s.artista_id
    GROUP BY `artista` , `album`
    ORDER BY `seguidores` DESC , `artista` , `album`;
