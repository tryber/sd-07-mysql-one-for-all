CREATE VIEW cancoes_premium AS
SELECT s.song_name AS nome,
COUNT(his.song_id) AS reproducoes FROM songs AS s
INNER JOIN history AS his
ON s.song_id = his.song_id
INNER JOIN users AS `use`
ON his.user_id = `use`.user_id
INNER JOIN signatures AS sig
ON `use`.signature_id = sig.signature_id
WHERE sig.signature_name IN ("familiar", "universitario")
GROUP BY s.song_name
ORDER BY nome;
