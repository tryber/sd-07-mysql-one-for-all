CREATE VIEW top_2_hits_do_momento AS (
  SELECT S.music_name AS cancao, COUNT(*) AS reproducoes
  FROM SpotifyClone.musics AS S
    JOIN SpotifyClone.music_history AS mhistory
      ON S.id = mhistory.music_id
  GROUP BY music_id
  ORDER BY 'reproducoes' DESC, 'cancao'
  LIMIT 2
);
