CREATE VIEW top_2_hits_do_momento AS
SELECT nome "cancao",
(SELECT COUNT(*) FROM SpotifyClone.hist_reproducoes WHERE cancao_id = c.cancao_id) "reproducoes"
FROM SpotifyClone.cancoes AS c
ORDER BY `reproducoes` DESC, `cancao`
LIMIT 2;