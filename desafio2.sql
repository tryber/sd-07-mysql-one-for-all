
CREATE VIEW estatisticas_musicais AS (SELECT * FROM
  (SELECT COUNT(songNAME) AS `cancoes` FROM song) AS `cancoes`,
  (SELECT COUNT(artistFIRSTNAME) AS `artistas` FROM artist)  AS `artistas`,
  (SELECT COUNT(albumNAME) AS `albuns` FROM album) AS `albuns`
);
