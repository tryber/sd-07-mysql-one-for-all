create view top_2_hits_do_momento as select
t2.nome as cancao,
count(*) as reproducoes
from SpotifyClone.historico_reproducoes as t1
inner join SpotifyClone.cancoes as t2
on t2.id_cancao = t1.id_cancao
group by t1.id_cancao
order by reproducoes desc, t2.nome
limit 2;
