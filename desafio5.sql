CREATE VIEW top_2_hits_do_momento AS (
  SELECT S.music_name AS cancao, COUNT(*) AS reproducoes
  FROM SpotifyClone.musics AS S
    LEFT JOIN SpotifyClone.music_history AS mhistory
      ON S.id = mhistory.song_id
  GROUP BY music_id
  ORDER BY 'reproducoes' DESC, S.name ASC
  LIMIT 2
);
