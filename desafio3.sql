CREATE VIEW historico_reproducao_usuarios AS
SELECT
`use`.nome_usuario AS usuario,
mus.nome_musica AS nome
FROM SpotifyClone.usuario AS `use`
INNER JOIN SpotifyClone.historico_reproducao AS his
ON `use`.usuario_id = his.usuario_id
INNER JOIN SpotifyClone.musica AS mus
ON mus.musica_id = his.musica_id
ORDER BY usuario, nome;
