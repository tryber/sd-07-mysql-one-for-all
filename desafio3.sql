CREATE VIEW historico_reproducao_usuarios AS  
  SELECT Users.user_name AS usuario, Songs.song_name AS nome
  FROM SpotifyClone.Users AS Users
  INNER JOIN SpotifyClone.Music_history AS MH
  ON Users.user_id = MH.user_id
  INNER JOIN SpotifyClone.Songs AS Songs
  ON MH.song_id = Songs.song_id
  ORDER BY Users.user_name, Songs.song_name;
