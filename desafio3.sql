CREATE VIEW SpotifyClone.historico_de_reproducao_usuario AS
SELECT
u.usuario AS 'usuario',
c.cancao AS 'nome'
FROM SpotifyClone.historico_de_reproducoes hr
JOIN SpotifyClone.usuarios u ON hr.usuario_id = u.usuario_id
JOIN SpotifyClone.cancoes c ON hr.cancao_id = c.cancao_id
ORDER BY u.usuario, c.cancao;
