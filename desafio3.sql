CREATE VIEW historico_reproducao_usuarios AS
SELECT
(
SELECT user_name FROM users WHERE user_id = p.user_id
) AS usuario,
(
SELECT song_title FROM songs WHERE song_id = p.song_id
) AS nome
FROM plays p
ORDER BY 1,2;
