create view `top_2_hits_do_momento` as
SELECT
count(SpotifyClone.historico.usuario_id) as reproducoes,
SpotifyClone.cancoes.cancoes as cancao
FROM SpotifyClone.historico
inner join SpotifyClone.cancoes
on SpotifyClone.historico.cancoes_id = SpotifyClone.cancoes.id
group by cancoes_id
order by 1 desc, 2
limit 2;
