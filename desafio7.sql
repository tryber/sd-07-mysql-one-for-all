CREATE VIEW `perfil_artistas` AS
    SELECT art.name AS `artista`,
        alb.album AS `album`,
        COUNT(ua.id_artist) AS `seguidores`
    FROM SpotifyClone.albums AS alb
        INNER JOIN SpotifyClone.artists AS art
            ON alb.id_artist = art.id_artist
        INNER JOIN SpotifyClone.users_artists AS ua
            ON ua.id_artist = art.id_artist
    GROUP BY alb.id_album
    ORDER BY `seguidores` DESC, `artista`;
