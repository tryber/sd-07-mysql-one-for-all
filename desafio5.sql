create view top_2_hits_do_momento as 
select 
m.musica_titulo as cancao,
count(h.usuario_id) as reproducoes
from SpotifyClone.historico_de_reproducao as h
inner join SpotifyClone.musicas as m
on h.musica_id = m.musica_id
group by m.musica_titulo
order by 2 desc,1
limit 2;
