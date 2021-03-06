DELIMITER $$
CREATE PROCEDURE albuns_do_artista( IN artista VARCHAR(100)) 
BEGIN
SELECT AR.nome_artista AS `artista`,
AL.nome_album AS `album`
FROM SpotifyClone.artista AS AR
INNER JOIN SpotifyClone.album AS AL ON AL.id_artista = AR.id_artista
WHERE AR.nome_artista = artista;
END $$
DELIMITER ;
