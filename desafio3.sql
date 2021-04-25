CREATE VIEW historico_reproducao_usuarios AS
SELECT u.usuario_nome AS usuario, c.cancoes_nome AS nome
FROM SpotifyClone.historico_reproducoes as hr
INNER JOIN SpotifyClone.cancoes AS c ON hr.cancoes_id = c.cancoes_id
INNER JOIN SpotifyClone.usuario AS u ON hr.usuario_id = u.usuario_id
ORDER BY 1, 2;
