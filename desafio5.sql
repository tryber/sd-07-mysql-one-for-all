CREATE VIEW SpotifyClone.top_2_hits_do_momento AS
SELECT m.musica_nome AS `cancao`,
    COUNT(*) AS `reproducoes`
FROM SpotifyClone.historico AS h
    JOIN SpotifyClone.musica AS m ON m.musica_id = h.musica_id
GROUP BY m.musica_id
ORDER BY `reproducoes` DESC,
    `cancao`
LIMIT 2;
