CREATE VIEW cancoes_premium AS
SELECT c.nome_da_cancao AS nome, COUNT(hr.cancao_id) AS reproducoes
FROM SpotifyClone.cancao c
INNER JOIN SpotifyClone.historico_de_reproducao hr
ON c.cancao_id = hr.cancao_id
WHERE c.cancao_id = hr.cancao_id
GROUP BY c.nome_da_cancao
ORDER BY 1;
