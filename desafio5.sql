  CREATE VIEW top_2_hits_do_momento AS
  SELECT son.name AS cancao, COUNT(h.song_id) AS reproducoes
  FROM SpotifyClone.songs AS son
  INNER JOIN SpotifyClone.user_history_songs AS h
  ON h.song_id = son.song_id
  GROUP BY son.name
  ORDER BY COUNT(h.song_id) DESC, son.name
  LIMIT 2;
