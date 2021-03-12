CREATE VIEW historico_de_reproducao_usuarios AS
SELECT
u.usuario AS usuario,
c.cancao AS nome
FROM SpotifyClone.historico_de_reproducao_usuarios AS h
INNER JOIN SpotifyClone.usuarios AS u ON h.usuario_id = u.usuario_id
INNER JOIN SpotifyClone.cancoes AS c ON h.cancao_id = c.musicas_id
ORDER BY usuario, nome;
