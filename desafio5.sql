CREATE VIEW top_2_hits_do_momento AS SELECT son.son_name AS 'cancao',
COUNT(his.use_id) AS 'reproducoes' FROM SpotifyClone.Historic AS his
INNER JOIN SpotifyClone.Songs AS son ON son.son_id = his.son_id
GROUP BY cancao
ORDER BY reproducoes DESC, cancao
LIMIT 2;
