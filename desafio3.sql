-- USE SpotifyClone;

-- DROP VIEW IF EXISTS historico_reproducao_usuarios;

CREATE VIEW historico_reproducao_usuarios AS
  SELECT
    u.name AS usuario,
    so.name AS nome
  FROM history AS h
  JOIN users AS u
    ON h.user_id = u.user_id
  JOIN songs AS so
    ON h.song_id = so.song_id
  ORDER BY usuario, nome;

-- SELECT * FROM historico_reproducao_usuarios;
