CREATE VIEW top_2_hits_do_momento AS
SELECT C.cancao_nome as cancao,
COUNT(fk_cancao_id) as reproducoes
FROM Cancoes AS C
INNER JOIN Historico_Usuarios AS H
ON H.fk_cancao_id = C.cancao_id
GROUP BY cancao
ORDER BY reproducoes DESC, cancao ASC
LIMIT 2;
