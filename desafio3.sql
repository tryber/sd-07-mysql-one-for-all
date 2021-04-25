create view historico_reproducao_usuarios as
select t1.nome as usuario, 
t3.nome as nome
from SpotifyClone.usuarios as t1
inner join SpotifyClone.historico_reproducoes as t2
on t1.id_usuario = t2.id_usuario
inner join SpotifyClone.cancoes as t3
on t2.id_cancao = t3.id_cancao
order by t1.nome, t3.nome;
