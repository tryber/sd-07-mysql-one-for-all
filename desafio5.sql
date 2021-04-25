CREATE VIEW SpotifyClone.top_2_hits_do_momento AS
SELECT
c.cancao AS 'cancao',
COUNT(*) AS 'reproducoes'
FROM SpotifyClone.historico_de_reproducoes hr
JOIN SpotifyClone.cancoes c ON hr.cancao_id = c.cancao_id
GROUP BY c.cancao
ORDER BY `reproducoes` DESC, `cancao`
LIMIT 2;
