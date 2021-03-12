create view top_2_hits_do_momento as
select c.nome_cancao as cancao,
count(hr.id_cancao) as reproducoes
from SpotifyClone.cancoes c
inner join SpotifyClone.historico_reproducao hr
on hr.id_cancao = c.id_cancao
group by `cancao` order by `reproducoes` desc, `cancao` limit 2;
