CREATE VIEW historico_reproducao_usuarios AS
SELECT us.usuario AS "usuario",
ca.cancao AS "nome"
FROM SpotifyClone.users AS us
INNER JOIN SpotifyClone.historicos AS hi
ON us.usuario_id = hi.usuario_id
INNER JOIN SpotifyClone.cancoes ca
ON hi.cancao_id = ca.cancao_id
ORDER BY 1, 2;
