CREATE VIEW historico_reproducao_usuarios AS
SELECT u.usuario, c.cancao AS nome
FROM SpotifyClone.usuario_cancao AS uc
INNER JOIN SpotifyClone.usuarios AS u ON uc.usuario_id = u.usuario_id
INNER JOIN SpotifyClone.cancoes AS c ON uc.cancao_id = c.cancao_id
ORDER BY u.usuario, c.cancao;
