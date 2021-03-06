CREATE VIEW faturamento_atual AS
SELECT
  MIN(PLANOS.valor) AS "faturamento_minimo",
  MAX(PLANOS.valor) AS "faturamento_maximo",
  ROUND(AVG(PLANOS.valor),2) AS "faturamento_medio",
  ROUND(SUM(PLANOS.valor),2) AS "faturamento_total"
FROM SpotifyClone.planos AS PLANOS
INNER JOIN SpotifyClone.usuarios AS USUARIOS
ON USUARIOS.plano_id = PLANOS.plano_id;
