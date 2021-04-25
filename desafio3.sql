CREATE VIEW SpotifyClone.historico_reproducao_usuarios AS
SELECT usr.usuario AS `usuario`,
can.cancao AS `nome`
FROM SpotifyClone.usuarios AS usr
INNER JOIN SpotifyClone.historico_de_reproducoes AS his
ON usr.usuario_id = his.usuario_id
INNER JOIN SpotifyClone.cancoes AS can
ON his.cancao_id = can.cancao_id
ORDER BY usuario, nome;
