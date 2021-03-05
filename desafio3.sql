CREATE VIEW historico_reproducao_usuarios AS
SELECT
users.usuario AS usuario,
cancoes.cancao AS nome
FROM SpotifyClone.users AS users
INNER JOIN SpotifyClone.historico_reproducoes AS historico_reproducoes
ON users.usuario_id = historico_reproducoes.usuario_id
INNER JOIN SpotifyClone.cancoes AS cancoes
ON historico_reproducoes.cancoes_id = cancoes.cancoes_id
ORDER BY usuario, nome;
