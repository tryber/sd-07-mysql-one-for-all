create view cancoes_premium as
select
m.musica_titulo as nome,
count(*) as reproducoes
from SpotifyClone.historico_de_reproducao as h
inner join SpotifyClone.musicas as m on h.musica_id = m.musica_id
inner join SpotifyClone.usuarios as u on h.usuario_id = u.usuario_id
inner join SpotifyClone.planos as p on u.plano_id = p.plano_id
where p.plano_tipo in ('familiar', 'universitario')
group by m.musica_titulo
order by 1;
