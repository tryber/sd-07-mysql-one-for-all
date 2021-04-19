CREATE VIEW historico_reproducao_usuarios AS
SELECT
u.nome_usuario AS usuario, c.nome_da_cancao as nome
FROM SpotifyClone.usuario as u
INNER JOIN SpotifyClone.historico_de_reproducao as hr
ON u.usuario_id = hr.usuario_id
INNER JOIN SpotifyClone.cancao as c
ON hr.cancao_id = c.cancao_id
ORDER BY 1, 2;
