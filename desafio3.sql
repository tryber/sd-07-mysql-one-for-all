CREATE VIEW `historico_reproducao_usuarios` AS
    SELECT u.name AS `usuario`,
    s.song AS `nome`
    FROM SpotifyClone.users_songs AS us
        INNER JOIN SpotifyClone.users AS u
            ON us.id_user = u.id_user
        INNER JOIN SpotifyClone.songs AS s
            ON us.id_song = s.id_song
    ORDER BY `usuario`, `nome`;
        