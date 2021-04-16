CREATE VIEW top_2_hits_do_momento AS
SELECT ca.cancao AS "cancao",
COUNT(ca.cancao_id) AS "reproducoes"
FROM SpotifyClone.cancoes AS ca
INNER JOIN SpotifyClone.historicos AS hi
ON ca.cancao_id = hi.cancao_id
GROUP BY 1
ORDER BY 2 DESC, 1
LIMIT 2;
