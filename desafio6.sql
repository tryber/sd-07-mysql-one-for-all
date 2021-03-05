-- CREATE VIEW faturamento_atual AS
-- SELECT
-- ROUND(MIN((SELECT valor_plano FROM SpotifyClone.planos WHERE plano_id = u.plano_id)),2) "faturamento_minimo",
-- ROUND(MAX((SELECT valor_plano FROM SpotifyClone.planos WHERE plano_id = u.plano_id)),2) "faturamento_maximo",
-- ROUND(AVG((SELECT valor_plano FROM SpotifyClone.planos WHERE plano_id = u.plano_id)),2) "faturamento_medio",
-- ROUND(SUM((SELECT valor_plano FROM SpotifyClone.planos WHERE plano_id = u.plano_id)),2) "faturamento_total"
-- FROM SpotifyClone.usuarios AS u;

CREATE VIEW faturamento_atual AS
SELECT
ROUND(MIN(p.valor_plano),2) faturamento_minimo,
ROUND(MAX(p.valor_plano),2) faturamento_maximo,
ROUND(AVG(p.valor_plano),2) faturamento_medio,
ROUND(SUM(p.valor_plano),2) faturamento_total
FROM SpotifyClone.usuarios AS u
INNER JOIN SpotifyClone.planos AS p ON p.plano_id = u.plano_id;