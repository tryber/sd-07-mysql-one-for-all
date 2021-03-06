CREATE VIEW SpotifyClone.historico_reproducao_usuarios AS
SELECT us.usuario AS `usuario`,
can.cancao AS `nome`
FROM SpotifyClone.usuarios AS us
INNER JOIN SpotifyClone.historico_de_reproducoes AS his
ON us.usuario_id = his.usuario_id
INNER JOIN SpotifyClone.cancoes AS can
ON his.cancao_id = can.cancao_id
ORDER BY usuario, nome;
