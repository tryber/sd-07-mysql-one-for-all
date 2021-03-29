DELIMITER $$
CREATE PROCEDURE `albuns_do_artista`(IN `param_artista` VARCHAR(45))
BEGIN
SELECT
ART.artista AS `artista`,
ALB.album AS `album`
FROM SpotifyClone.artistas AS ART
INNER JOIN SpotifyClone.albuns AS ALB ON ART.artista_id = ALB.artista_id
WHERE ART.artista = `param_artista`;
END $$;
DELIMITER ;
