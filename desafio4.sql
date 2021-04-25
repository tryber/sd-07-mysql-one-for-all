CREATE VIEW `top_3_artistas` AS
    SELECT a.name AS `artista`,
    COUNT(ua.id_user) AS `seguidores`
    FROM SpotifyClone.users_artists AS ua
        INNER JOIN SpotifyClone.artists AS a
            ON ua.id_artist = a.id_artist
    GROUP BY `artista`
    ORDER BY `seguidores` DESC, `artista`
    LIMIT 3;
