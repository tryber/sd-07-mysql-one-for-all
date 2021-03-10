CREATE VIEW SpotifyClone.historico_reproducao_usuarios AS
SELECT usuario.usuario AS usuario,
cancao.cancao AS nome
FROM SpotifyClone.usuario AS usuario
INNER JOIN SpotifyClone.historico_reproducoes AS hist
ON usuario.usuario_id = hist.usuario_id
INNER JOIN SpotifyClone.cancao AS cancao
ON cancao.cancao_id = hist.cancao_id
ORDER BY usuario.usuario, cancao.cancao;
