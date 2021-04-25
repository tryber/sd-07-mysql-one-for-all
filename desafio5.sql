CREATE VIEW top_2_hits_do_momento AS
SELECT
C.cancao AS 'cancao',
COUNT(H.cancao_id) AS 'reproducoes'
FROM SpotifyClone.cancoes AS C
INNER JOIN SpotifyClone.historico AS H
ON C.cancao_id = H.cancao_id
GROUP BY C.cancao
ORDER BY `reproducoes` DESC, C.cancao
LIMIT 2;
