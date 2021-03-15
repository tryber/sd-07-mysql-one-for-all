DELIMITER $$

CREATE PROCEDURE `albuns_do_artista`(IN nome_artista VARCHAR(100))
BEGIN
SELECT AR.nome_artista AS 'artista',
AB.nome_album AS 'album'
FROM SpotifyClone.artistas AS AR
INNER JOIN SpotifyClone.albuns AS AB ON AB.id_artista = AR.id_artista
WHERE AR.nome_artista = nome_artista
ORDER BY `album`;
END $$

DELIMITER ;
