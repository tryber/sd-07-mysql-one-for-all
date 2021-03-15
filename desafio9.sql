DELIMITER $$

CREATE PROCEDURE albuns_do_artista(IN nomeArtista TEXT)
BEGIN
    SELECT art.artista_nome AS "artista"
    FROM SpotifyClone.artistas AS art
    INNER JOIN SpotifyClone.albuns AS alb
    ON alb.album_id = art.album_id
    WHERE nomeArtista = art.artista_nome
    ORDER BY 2;
END $$

DELIMITER ;

CALL albuns_do_artista('Walter Phoenix');
