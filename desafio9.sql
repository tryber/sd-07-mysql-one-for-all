USE SpotifyClone;

DELIMITER $$

CREATE PROCEDURE albuns_do_artista(IN input VARCHAR(50))
BEGIN
  SELECT CONCAT(art.artistFIRSTNAME, ' ', art.artistLASTNAME) AS `artista`,
  alb.albumNAME AS `album` FROM artist AS `art`
  INNER JOIN album AS `alb` 
    ON art.artistID = alb.artistID
  WHERE CONCAT(art.artistFIRSTNAME, ' ', art.artistLASTNAME)  = input
    ORDER BY `album`;

END $$

DELIMITER ;
