CREATE VIEW top_2_hits_do_momento AS
  SELECT S.song_name AS cancao, COUNT(MH.song_id) AS reproducoes
  FROM SpotifyClone.Songs AS S
  INNER JOIN SpotifyClone.Music_history AS MH
  ON S.song_id = MH.song_id
  GROUP BY S.song_name
  ORDER BY reproducoes DESC, cancao
  LIMIT 2;
