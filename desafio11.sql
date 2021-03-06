-- USE SpotifyClone;

-- DROP VIEW IF EXISTS cancoes_premium;

CREATE VIEW cancoes_premium AS
  SELECT
    so.name AS nome,
    COUNT(DISTINCT h.user_id) AS reproducoes
  FROM history AS h
  JOIN songs AS so
    ON h.song_id = so.song_id
  JOIN users AS u
    ON h.user_id = u.user_id
  WHERE u.subscription_id > 1
  GROUP BY nome
  ORDER BY nome;

-- SELECT * FROM cancoes_premium;
