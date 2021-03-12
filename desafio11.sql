
create view cancoes_premium as
select c.nome_cancao as nome,
count(hr.id_cancao) AS reproducoes
from SpotifyClone.historico_reproducao as hr
inner join SpotifyClone.cancoes as c on hr.id_cancao = c.id_cancao
inner join SpotifyClone.usuario as u on hr.id_usuario = u.id_usuario
where u.id_plano in (2, 3)
group by c.cancoes_nome
order by 1;
