DELIMITER $$
CREATE PROCEDURE albuns_do_artista(IN nome_artista VARCHAR(50))
BEGIN
SELECT
a.nome AS artista,
al.nome AS album
FROM album al
LEFT JOIN artista a ON a.artista_id = al.artista_id
WHERE a.nome = nome_artista; 
END $$
DELIMITER ;
