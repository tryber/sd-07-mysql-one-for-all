CREATE VIEW cancoes_premium AS
SELECT
mus.song_colum AS nome,
COUNT(his.song_id) AS reproducoes
FROM songs AS mus
INNER JOIN history AS his
ON mus.song_id = his.song_id
INNER JOIN users AS `use`
ON his.user_id = `use`.user_id
INNER JOIN plans AS pla
ON `use`.plan_id = pla.plan_id
WHERE pla.plan_colum IN ("familiar", "universitario")
GROUP BY mus.song_colum
ORDER BY nome;
/* Referencia Cosmo, esse tava dificil */
