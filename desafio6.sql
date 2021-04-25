CREATE VIEW faturamento_atual AS
SELECT MIN(P.valor) AS 'faturamento_minimo',
MAX(P.valor) AS 'faturamento_maximo',
ROUND(AVG(P.valor), 2) AS 'faturamento_medio',
SUM(P.valor) AS 'faturamento_total'
FROM SpotifyClone.planos AS P
INNER JOIN SpotifyClone.usuarios AS U ON U.id_plano = P.id_plano;
