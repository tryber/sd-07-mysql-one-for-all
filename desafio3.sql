CREATE VIEW historico_reproducao_usuarios AS
SELECT u.nome AS usuario,
c.nome AS nome
FROM SpotifyClone.historico_reproducoes AS hr
INNER JOIN SpotifyClone.usuarios AS u
ON hr.usuario_id = u.usuario_id
INNER JOIN SpotifyClone.cancoes AS c
ON c.cancao_id = hr.cancao_id
ORDER BY u.nome, c.nome;
