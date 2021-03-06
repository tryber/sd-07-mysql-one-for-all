CREATE VIEW faturamento_atual AS
SELECT
    ROUND(MIN(P.price_plano),2) AS 'faturamento_minimo',
    ROUND(MAX(P.price_plano),2) AS 'faturamento_maximo',
    ROUND(AVG(P.price_plano),2) AS 'faturamento_medio',
    ROUND(SUM(P.price_plano),2) AS 'faturamento_total'
FROM SpotifyClone.usuario U
JOIN SpotifyClone.planos P WHERE P.idplanos = U.planos_idplanos;

