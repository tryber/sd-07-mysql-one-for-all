CREATE VIEW `cancoes_premium` AS
    SELECT s.song AS `nome`,
        COUNT(us.id_user) AS `reproducoes`
        FROM SpotifyClone.users_songs AS us
            INNER JOIN SpotifyClone.songs AS s
                ON s.id_song = us.id_song
            INNER JOIN SpotifyClone.users AS u
                ON u.id_user = us.id_user
        WHERE u.id_plan = 2 OR u.id_plan = 3 
        GROUP BY `nome`
        ORDER BY `nome`;
