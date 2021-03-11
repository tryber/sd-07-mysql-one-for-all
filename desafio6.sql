
CREATE VIEW faturamento_atual AS (
  SELECT MIN(pln.planVALUE) AS `faturamento_minimo`, 
    MAX(pln.planVALUE) AS `faturamento_maximo`,
    ROUND(AVG(pln.planVALUE),2) AS `faturamento_medio`,
    SUM(pln.planVALUE) AS `faturamento_total`
  FROM plan AS `pln`
  INNER JOIN user AS `usr` 
    ON usr.planID = pln.planID
);
