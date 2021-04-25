CREATE VIEW historico_reproducao_usuarios AS
SELECT u.user_name AS usuario, 
s.song_name AS nome FROM users AS u
INNER JOIN history AS h ON u.user_id = h.user_id
INNER JOIN songs AS s ON s.song_id = h.song_id
ORDER BY usuario, nome ASC;
