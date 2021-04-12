CREATE VIEW cancoes_premium AS 
SELECT
  SpotifyClone.musical_track.name AS "nome",
  COUNT(SpotifyClone.user_history_songs.songs_id) AS "reproducoes"
FROM SpotifyClone.musical_track
JOIN SpotifyClone.user_history_songs
ON SpotifyClone.user_history_songs.songs_id = SpotifyClone.musical_track.id
JOIN SpotifyClone.users
ON SpotifyClone.user_history_songs.user_id = SpotifyClone.users.id
WHERE SpotifyClone.users.plan_id IN (2,3)
GROUP BY SpotifyClone.musical_track.name
ORDER BY nome;
