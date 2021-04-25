CREATE VIEW historico_reproducao_usuarios AS
SELECT
usr.usuario AS usuario,
can.cancao AS nome
FROM SpotifyClone.usuarios AS usr
JOIN SpotifyClone.historicos AS hst
ON hst.usuario_id = usr.usuario_id
JOIN SpotifyClone.cancoes AS can
ON hst.cancao_id = can.cancao_id
ORDER BY 1, 2;
