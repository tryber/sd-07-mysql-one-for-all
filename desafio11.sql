CREATE VIEW cancoes_premium
AS SELECT son.son_name AS 'nome',
COUNT(his.use_id) AS 'reproducoes'
FROM SpotifyClone.Historic AS his
INNER JOIN SpotifyClone.Songs AS son ON son.son_id = his.son_id
INNER JOIN SpotifyClone.Users AS usr ON usr.use_id = his.use_id
WHERE usr.pla_id > 1 GROUP BY nome ORDER BY nome;
