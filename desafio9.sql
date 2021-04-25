
USE SpotifyClone;
DELIMITER $$;
CREATE PROCEDURE albuns_do_artista(IN nome_do_artista VARCHAR(45))
BEGIN
SELECT a.nome AS artista, al.nome AS album
FROM artistas AS a
INNER JOIN albums AS al
ON a.id = al.artista_id
HAVING artista = nome_do_artista;
END $$;
DELIMITER ;
