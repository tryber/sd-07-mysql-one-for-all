CREATE VIEW top_2_hits_do_momento AS
SELECT c.nome_da_cancao AS cancao, COUNT(hr.cancao_id) as reproducoes
FROM SpotifyClone.cancao c
INNER JOIN SpotifyClone.historico_de_reproducao hr
ON c.cancao_id = hr.cancao_id 
GROUP BY 1
ORDER BY 2 DESC, 1
LIMIT 2;
