CREATE VIEW historico_reproducao_usuarios AS
SELECT usuarios.usuario AS usuario, cancoes.cancao AS nome
FROM SpotifyClone.usuarios AS usuarios
INNER JOIN SpotifyClone.historicos AS historicos ON usuarios.id = historicos.usuario_id
INNER JOIN SpotifyClone.cancoes AS cancoes ON cancoes.id = historicos.cancao_id
ORDER BY `usuario`, `nome`;
