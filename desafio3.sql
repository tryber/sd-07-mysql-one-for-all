CREATE VIEW historico_reproducao_usuarios AS SELECT usr.use_name AS 'usuario',
son.son_name AS 'nome'
FROM SpotifyClone.Historic AS his
INNER JOIN SpotifyClone.Users AS usr ON usr.use_id = his.use_id
INNER JOIN SpotifyClone.Songs AS son ON son.son_id = his.son_id
ORDER BY usuario, nome;
