CREATE VIEW historico_reproducao_usuarios AS 
SELECT u.usuario AS usuario, c.cancao AS nome
FROM SpotifyClone.historico_de_reproducoes AS h 
INNER JOIN SpotifyClone.usuarios AS u ON u.usuario_id = h.usuario_id
INNER JOIN SpotifyClone.cancoes AS c ON h.cancao_id = c.cancao_id
ORDER BY usuario, nome;
