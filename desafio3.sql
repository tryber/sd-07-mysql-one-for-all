CREATE VIEW historico_reproducao_usuarios AS
SELECT u.`name` AS usuario, s.`name` as nome
FROM `user` u
INNER JOIN user_songs_reproduction usr ON u.user_id = usr.user_id
INNER JOIN songs s ON s.song_id = usr.song_id
ORDER BY 1, 2;
