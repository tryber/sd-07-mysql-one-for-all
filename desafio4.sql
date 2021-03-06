-- USE SpotifyClone;

-- DROP VIEW IF EXISTS top_3_artistas;

CREATE VIEW top_3_artistas AS
  SELECT
    si.name AS artista,
    COUNT(DISTINCT f.user_id) AS seguidores
  FROM following AS f
  JOIN singers AS si
    ON f.singer_id = si.singer_id
  GROUP BY artista
  ORDER BY seguidores DESC, artista
  LIMIT 3;

-- SELECT * FROM top_3_artistas;
