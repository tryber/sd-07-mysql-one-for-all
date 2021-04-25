CREATE VIEW `historico_reproducao_usuarios` AS
SELECT 
  user.user_name AS `usuario`,
  music.music_name AS `nome` 
FROM 
(
  (SpotifyClone.historys AS `history`
  INNER JOIN SpotifyClone.user AS `user` ON history.id_user = user.user_id)
  INNER JOIN SpotifyClone.musics AS `music` ON history.id_music = music.music_id
)
ORDER BY
`usuario`, `nome`; 
