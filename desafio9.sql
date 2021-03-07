DELIMITER $$
CREATE PROCEDURE SpotifyClone.albuns_do_artista(IN nome VARCHAR(100))
    BEGIN
        SELECT
            t1.nome AS artista,
            t2.title AS album
        FROM SpotifyClone.Artista AS t1
            INNER JOIN SpotifyClone.Album t2 ON t2.artista_id = t1.id
        WHERE t1.nome = nome
        ORDER BY t2.title ASC;
    END $$
DELIMITER ;
