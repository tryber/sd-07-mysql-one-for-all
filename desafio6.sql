CREATE VIEW faturamento_atual AS
SELECT ROUND(MIN(B.plano_valor), 2) faturamento_minimo, ROUND(MAX(B.plano_valor), 2) faturamento_maximo,
ROUND(AVG(B.plano_valor), 2) faturamento_medio, ROUND(SUM(B.plano_valor), 2) faturamento_total
FROM SpotifyClone.usuarios A, SpotifyClone.planos B
WHERE A.plano_id=B.plano_id;
