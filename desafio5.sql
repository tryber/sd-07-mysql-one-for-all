CREATE VIEW top_2_hits_do_momento AS (
  SELECT S.music_name AS 'cancao', COUNT(mhistory.user_id) AS 'reproducoes'
    FROM SpotifyClone.musics AS S
    INNER JOIN SpotifyClone.music_history AS mhistory
    ON mhistory.music_id = S.id
    GROUP BY music_id
    ORDER BY `reproducoes` DESC, `cancao` ASC
  LIMIT 2
);
