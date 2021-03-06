-- USE SpotifyClone;

-- DROP VIEW IF EXISTS faturamento_atual;

CREATE VIEW faturamento_atual AS
  SELECT
    MIN(su.price) AS faturamento_minimo,
    MAX(su.price) AS faturamento_maximo,
    ROUND(AVG(su.price), 2) AS faturamento_medio,
    SUM(su.price) AS faturamento_total
  FROM subscriptions AS su
  JOIN users AS u
    ON su.subscription_id = u.subscription_id;

-- SELECT * FROM faturamento_atual;
