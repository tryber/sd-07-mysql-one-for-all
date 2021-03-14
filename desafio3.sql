CREATE VIEW historico_reproducao_usuarios AS
SELECT
u.nome AS usuario,
m.nome AS nome
FROM
SpotifyClone.usuario AS u
INNER JOIN SpotifyClone.historico AS h ON u.usuario_id = h.usuario_id
INNER JOIN SpotifyClone.musica AS m ON h.musica_id = m.musica_id
ORDER BY usuario ASC, nome ASC;
