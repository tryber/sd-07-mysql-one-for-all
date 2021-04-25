CREATE VIEW faturamento_atual AS 
SELECT ROUND(MIN(sig.signature_price ),2) AS faturamento_minimo,
ROUND(MAX(sig.signature_price ),2) AS faturamento_maximo,
ROUND(AVG(sig.signature_price ),2) AS faturamento_medio,
ROUND(SUM(sig.signature_price ),2) AS faturamento_total
FROM SpotifyClone.users AS u
INNER JOIN SpotifyClone.signatures AS sig
ON sig.signature_id = u.signature_id;
