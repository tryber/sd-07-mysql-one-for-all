CREATE VIEW historico_de_reproducoes AS
SELECT u.usuario AS usuario,
c.cancao AS nome
FROM SpotifyClone.historico_de_reproducoes AS h
INNER JOIN SpotifyClone.usuarios AS u
ON h.usuario_id = u.usuario_id
INNER JOIN SpotifyClone.cancoes AS c
ON c.cancao_id = h.cancao_id
ORDER BY usuario, nome;
