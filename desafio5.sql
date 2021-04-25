-- USE SpotifyClone;

-- DROP VIEW IF EXISTS top_2_hits_do_momento;

CREATE VIEW top_2_hits_do_momento AS
  SELECT
    so.name AS cancao,
    COUNT(DISTINCT h.user_id) AS reproducoes
  FROM history AS h
  JOIN songs AS so
    ON h.song_id = so.song_id
  GROUP BY cancao
  ORDER BY reproducoes DESC, cancao
  LIMIT 2;
  
-- SELECT * FROM top_2_hits_do_momento;
