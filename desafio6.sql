CREATE VIEW faturamento_atual AS 
  SELECT MIN(price) AS faturamento_minimo, MAX(price) AS faturamento_maximo, ROUND(AVG(price), 2) AS faturamento_medio, SUM(price) AS faturamento_total FROM(
  SELECT Users.plano_id, Plano.price
  FROM SpotifyClone.Users AS Users
  INNER JOIN SpotifyClone.Plano AS Plano
  ON Users.plano_id = Plano.plano_id) AS C;

