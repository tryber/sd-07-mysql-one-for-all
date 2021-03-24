CREATE VIEW historico_reproducao_usuarios AS
SELECT db_users.usuario AS 'usuario',
songs.cancao as 'nome'
FROM SpotifyClone.users as db_users
INNER JOIN historico_de_reproducoes as user_history
ON user_history.usuario_id = db_users.usuario_id
INNER JOIN songs
ON user_history.cancoes_id = songs.cancoes_id
ORDER BY usuario, nome ASC;
