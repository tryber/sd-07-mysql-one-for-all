SELECT
(SELECT MIN(SpotifyClone.plans.price) AS "faturamento_minimo" FROM SpotifyClone.plans join SpotifyClone.users on SpotifyClone.users.plan_id = plans.id) AS "faturamento_minimo",
(SELECT ROUND(MAX(SpotifyClone.plans.price), 2) AS "faturamento_maximo" FROM SpotifyClone.plans join SpotifyClone.users on SpotifyClone.users.plan_id = plans.id) AS "faturamento_maximo",
(SELECT ROUND(AVG(SpotifyClone.plans.price), 2) AS "faturamento_medio" FROM SpotifyClone.plans join SpotifyClone.users on SpotifyClone.users.plan_id = plans.id) AS "faturamento_medio",
(SELECT ROUND(SUM(SpotifyClone.plans.price), 2) AS "faturamento_total" FROM SpotifyClone.plans join SpotifyClone.users on SpotifyClone.users.plan_id = plans.id) AS "faturamento_total";
