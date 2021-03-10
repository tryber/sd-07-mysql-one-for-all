SELECT MIN(P1.price) AS "faturamento_minimo" ,
MAX(P1.price) AS "faturamento_maximo",
ROUND(AVG(P1.price), 2)"faturamento_médio",
SUM(P1.price)"faturamento_total"
FROM spotifyclone.plans AS P1;
