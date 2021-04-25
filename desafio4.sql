CREATE VIEW top_3_artistas AS (
  SELECT CONCAT(art.artistFIRSTNAME,' ', art.artistLASTNAME) AS `artista`,
    COUNT(usr.userID) AS `seguidores` FROM artist AS `art`
  INNER JOIN user_artist AS `usr`
    ON art.artistID = usr.artistID
  GROUP BY usr.artistID ORDER BY `seguidores` DESC, `artista` LIMIT 3
);
