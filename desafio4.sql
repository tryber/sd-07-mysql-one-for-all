CREATE VIEW top_3_artistas AS (
  SELECT
  art.artist_name AS 'artista',
  COUNT(follow.user_id) AS 'seguidores'
  FROM SpotifyClone.artists AS art
  INNER JOIN SpotifyClone.followers AS follow ON follow.artist_id = art.id
  GROUP BY artist_id
  ORDER BY 2 DESC, 1
  LIMIT 3
);
