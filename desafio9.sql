CREATE PROCEDURE albuns_do_artista(IN nome_artista_parametro VARCHAR(50))
BEGIN
SELECT A.artista_nome AS artista,
Al.album_nome AS album
FROM Artistas AS A
INNER JOIN Albuns AS Al
ON Al.fk_artista_id = A.artista_id
WHERE A.artista_nome = nome_artista_parametro;
END $$;
DELIMITER ;
