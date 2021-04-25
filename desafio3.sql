CREATE VIEW historico_reproducao_usuarios AS
SELECT us.user_name AS 'usuario',
  so.song_name AS 'nome'
FROM SpotifyClone.User_Song AS uss
  JOIN SpotifyClone.Song AS so ON uss.song_ID = so.song_ID
  JOIN SpotifyClone.User AS us ON uss.user_ID = us.user_ID
ORDER BY 1,
  2;
