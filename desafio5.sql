CREATE VIEW SpotifyClone.top_2_hits_do_momento AS
SELECT
    t1.title AS cancao,
    COUNT(t2.cancao_id) AS reproducoes
FROM SpotifyClone.Cancao AS t1
    INNER JOIN SpotifyClone.HistoricoReproducao AS t2 ON t1.id = t2.cancao_id
GROUP BY t1.title
ORDER BY
    reproducoes desc,
    cancao
LIMIT 2;
