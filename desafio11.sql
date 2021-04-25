CREATE VIEW cancoes_premium AS
SELECT
mus.nome_musica AS nome,
COUNT(his.musica_id) AS reproducoes
FROM SpotifyClone.musica AS mus
INNER JOIN SpotifyClone.historico_reproducao AS his
ON mus.musica_id = his.musica_id
INNER JOIN SpotifyClone.usuario AS `use`
ON his.usuario_id = `use`.usuario_id
INNER JOIN SpotifyClone.plano AS pla
ON `use`.plano_id = pla.plano_id
WHERE pla.nome_plano IN ("familiar", "universitario")
GROUP BY mus.nome_musica
ORDER BY nome;
