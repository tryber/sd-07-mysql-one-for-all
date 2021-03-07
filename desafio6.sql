CREATE VIEW SpotifyClone.faturamento_atual AS
SELECT (
    SELECT ROUND(MIN(valor), 2)
    FROM SpotifyClone.planos
  ) AS `faturamento_minimo`,
  (
    SELECT ROUND(MAX(valor), 2)
    FROM SpotifyClone.planos
  ) AS `faturamento_maximo`,
  (
    SELECT ROUND(AVG(p.valor), 2)
    FROM SpotifyClone.planos AS p
      INNER JOIN SpotifyClone.usuarios AS u ON u.plano_id = p.plano_id
  ) AS `faturamento_medio`,
  (
    SELECT SUM(p.valor)
    FROM SpotifyClone.planos AS p
      INNER JOIN SpotifyClone.usuarios AS u ON u.plano_id = p.plano_id
  ) AS `faturamento_total`;
