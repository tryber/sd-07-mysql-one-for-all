
CREATE VIEW historico_reproducao_usuarios AS (
  SELECT usr.userNAME AS `usuario`, sng.songNAME AS `nome`
    FROM user AS `usr`
  INNER JOIN history AS `hst` 
    ON usr.userID = hst.userID
  INNER JOIN song AS `sng`
    ON hst.songID = sng.songID
  ORDER BY `usuario`, `nome`
);
