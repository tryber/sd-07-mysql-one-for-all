CREATE VIEW faturamento_atual AS
SELECT
(SELECT MIN(CAST(SpotifyClone.plans.price AS CHAR(5))) FROM SpotifyClone.plans join SpotifyClone.users on SpotifyClone.users.plan_id = SpotifyClone.plans.id) AS "faturamento_minimo",
(SELECT CAST(CONVERT((MAX(SpotifyClone.plans.price)), DECIMAL(6,2)) AS CHAR) FROM SpotifyClone.plans join SpotifyClone.users on SpotifyClone.users.plan_id = SpotifyClone.plans.id) AS "faturamento_maximo",
(SELECT CAST(CONVERT((AVG(SpotifyClone.plans.price)), DECIMAL(6,2)) AS CHAR) FROM SpotifyClone.plans join SpotifyClone.users on SpotifyClone.users.plan_id = SpotifyClone.plans.id) AS "faturamento_medio",
(SELECT CAST(CONVERT((SUM(SpotifyClone.plans.price)), DECIMAL(6,2)) AS CHAR) FROM SpotifyClone.plans join SpotifyClone.users on SpotifyClone.users.plan_id = SpotifyClone.plans.id) AS "faturamento_total";
