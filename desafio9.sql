DELIMITER $$

CREATE PROCEDURE albuns_do_artista(IN nome_artista varchar(100))
BEGIN
	SELECT
    art.nome "artista",
	alb.album  "album"
	FROM SpotifyClone.albuns AS alb
	INNER JOIN SpotifyClone.artistas AS art ON art.artista_id = alb.artista_id
    WHERE art.nome = nome_artista;
END $$

DELIMITER ;