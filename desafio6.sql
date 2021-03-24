CREATE VIEW faturamento_atual AS
SELECT 
    ROUND(MIN(PL.plan_price), 2) as faturamento_minimo,
    ROUND(MAX(PL.plan_price), 2) as faturamento_maximo,
    ROUND(AVG(PL.plan_price), 2) as faturamento_medio,
    ROUND(SUM(PL.plan_price), 2) as faturamento_total
FROM users USR
    INNER JOIN plans PL
    ON USR.id_plan = PL.id_plan;
