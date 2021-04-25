create view top_2_hits_do_momento as select
can.cancao as cancao,
count(*) as reproducoes
from SpotifyClone.reproducoes as rep
inner join SpotifyClone.cancoes as can
on can.cancao_id = rep.cancao_id
group by rep.cancao_id
order by reproducoes desc, can.cancao
limit 2;
