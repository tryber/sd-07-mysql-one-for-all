-- USE SpotifyClone;

-- DROP VIEW IF EXISTS estatisticas_musicais;

CREATE VIEW estatisticas_musicais AS
  SELECT
    COUNT(DISTINCT so.name) AS cancoes,
    COUNT(DISTINCT si.name) AS artistas,
    COUNT(DISTINCT a.name) AS albuns
  FROM SpotifyClone.albuns AS a
  JOIN singers AS si
    ON a.singer_id = si.singer_id
  JOIN songs AS so
    ON a.album_id = so.album_id;

--   SELECT * FROM estatisticas_musicais;
