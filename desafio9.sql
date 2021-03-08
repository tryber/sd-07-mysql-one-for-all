delimiter $$
CREATE PROCEDURE albuns_do_artista(IN nome VARCHAR(45))
BEGIN
SELECT a.nome AS artista,
al.nome AS album
FROM SpotifyClone.tabela_artistas a
INNER JOIN SpotifyClone.tabela_albuns al
ON a.id_artista = al.id_artista
WHERE a.nome = nome;
END $$
delimiter ;
