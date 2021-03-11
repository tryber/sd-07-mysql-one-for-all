CREATE VIEW perfil_artistas AS (
  SELECT CONCAT(art.artistFIRSTNAME, ' ', art.artistLASTNAME) AS `artista`,
    alb.albumNAME AS `album`, COUNT(usr.userID) AS `seguidores`
  FROM artist AS `art`
  INNER JOIN album AS `alb` 
    ON art.artistID = alb.artistID
  INNER JOIN user_artist AS `usr`
    ON art.artistID = usr.artistID
  GROUP BY usr.artistID, alb.albumNAME ORDER BY `seguidores` DESC, `artista`, `album`
);
