create view faturamento_atual as
SELECT (
SELECT
min(SpotifyClone.planos.valor)
FROM SpotifyClone.usuario
inner join SpotifyClone.planos
on SpotifyClone.usuario.plano_id = SpotifyClone.planos.id) as "faturamento_minimo",
(SELECT
max(SpotifyClone.planos.valor)
FROM SpotifyClone.usuario
inner join SpotifyClone.planos
on SpotifyClone.usuario.plano_id = SpotifyClone.planos.id) as "faturamento_maximo",
(SELECT
round(avg(SpotifyClone.planos.valor), 2)
FROM SpotifyClone.usuario
inner join SpotifyClone.planos
on SpotifyClone.usuario.plano_id = SpotifyClone.planos.id) as "faturamento_medio",
(SELECT
round(sum(SpotifyClone.planos.valor), 2)
FROM SpotifyClone.usuario
inner join SpotifyClone.planos
on SpotifyClone.usuario.plano_id = SpotifyClone.planos.id) as "faturamento_total";
