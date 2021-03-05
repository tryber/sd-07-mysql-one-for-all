CREATE VIEW top_3_artistas AS 
SELECT
  singers.name AS "artista",
  COUNT(following_artists.artist_id) AS "seguidores"
FROM SpotifyClone.singers
JOIN SpotifyClone.following_artists
ON following_artists.artist_id = singers.id
GROUP BY singers.id
ORDER BY seguidores DESC, artista LIMIT 3;
