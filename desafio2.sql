CREATE VIEW `estatisticas_musicais` AS
    SELECT COUNT(DISTINCT s.song) AS `cancoes`, 
        COUNT(DISTINCT art.name) AS `artistas`,
        COUNT(DISTINCT alb.album) AS `albuns`
    FROM SpotifyClone.songs AS s
        INNER JOIN SpotifyClone.albums AS alb
            ON s.id_album = alb.id_album
        INNER JOIN SpotifyClone.artists AS art
            ON art.id_artist = alb.id_artist;
