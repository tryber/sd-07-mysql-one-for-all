CREATE VIEW historico_reproducao_usuarios AS 
SELECT u.usuario as usuario, c.cancao as nome
FROM SpotifyClone.historico_de_reproducoes as h 
INNER JOIN SpotifyClone.usuarios as u ON u.usuario_id = h.usuario_id
INNER JOIN SpotifyClone.cancoes as c ON h.cancao_id = c.cancao_id
ORDER BY usuario, nome;
