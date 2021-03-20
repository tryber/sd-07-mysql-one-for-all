CREATE VIEW top_2_hits_do_momento AS
SELECT dbc.cancao as 'cancao',
COUNT(dbr.cancoes_id) as 'reproducoes'
FROM SpotifyClone.songs as dbc
INNER JOIN SpotifyClone.historico_de_reproducoes as dbr
ON dbc.cancoes_id = dbr.cancoes_id
GROUP BY `cancao`
ORDER BY `reproducoes` DESC, `cancao` ASC
LIMIT 2;
