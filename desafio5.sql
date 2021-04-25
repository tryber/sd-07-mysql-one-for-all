CREATE VIEW `top_2_hits_do_momento` AS
    SELECT s.song AS `cancao`,
    COUNT(us.id_user) AS `reproducoes`
    FROM SpotifyClone.users_songs AS us
        INNER JOIN SpotifyClone.songs AS s
            ON us.id_song = s.id_song
    GROUP BY `cancao`
    ORDER BY `reproducoes` DESC, `cancao`
    LIMIT 2;
