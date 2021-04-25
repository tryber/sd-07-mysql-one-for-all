  CREATE VIEW historico_reproducao_usuarios AS
  SELECT u.name AS usuario, s.name AS nome
  FROM SpotifyClone.users AS u
  INNER JOIN SpotifyClone.user_history_songs  as h
  ON u.user_id = h.user_id
  INNER JOIN SpotifyClone.songs as s
  ON h.song_id = s.song_id
  ORDER BY u.name, s.name;
