CREATE VIEW faturamento_atual AS SELECT
(SELECT MIN(p.preco) FROM SpotifyClone.tabela_planos p)
AS faturamento_minimo,
(SELECT MAX(p.preco) FROM SpotifyClone.tabela_planos p)
AS faturamento_maximo,
(SELECT ROUND(SUM(p.preco) / COUNT(u.id_usuario), 2)
FROM SpotifyClone.tabela_planos p
INNER JOIN SpotifyClone.tabela_usuario u
ON p.id_plano = u.id_plano)
AS faturamento_medio,
(SELECT SUM(p.preco)
FROM SpotifyClone.tabela_planos p
INNER JOIN SpotifyClone.tabela_usuario u
ON p.id_plano = u.id_plano)
AS faturamento_total;
