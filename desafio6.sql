CREATE VIEW faturamento_atual AS
SELECT ROUND(MIN(P.preco),2) AS `faturamento_minimo`,
ROUND(MAX(P.preco),2) AS `faturamento_maximo`,
ROUND(SUM(P.preco) / COUNT(US.nome_usuario),2) AS `faturamento_medio`,
ROUND(SUM(P.preco),2) AS `faturamento_total`
FROM SpotifyClone.planos AS P
INNER JOIN SpotifyClone.usuarios AS US ON US.id_plano = P.id_plano;
