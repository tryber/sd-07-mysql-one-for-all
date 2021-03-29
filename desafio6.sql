CREATE VIEW `faturamento_atual` AS SELECT

(SELECT ROUND(MIN(P.preco),2) FROM SpotifyClone.planos AS P
INNER JOIN SpotifyClone.usuarios AS U ON U.id_plano = P.id_plano) AS `faturamento_minimo`,

(SELECT ROUND(MAX(P.preco),2) FROM SpotifyClone.planos AS P
INNER JOIN SpotifyClone.usuarios AS U ON U.id_plano = P.id_plano) AS `faturamento_maximo`,

(SELECT ROUND(AVG(P.preco),2) FROM SpotifyClone.planos AS P
INNER JOIN SpotifyClone.usuarios AS U ON U.id_plano = P.id_plano) AS `faturamento_medio`,

(SELECT ROUND(SUM(P.preco),2) FROM SpotifyClone.planos AS P
INNER JOIN SpotifyClone.usuarios AS U ON U.id_plano = P.id_plano) AS `faturamento_total`;
