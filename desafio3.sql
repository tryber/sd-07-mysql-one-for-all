create view historico_reproducao_usuarios as
select u.nome as usuario,
c.nome_cancao as nome
from SpotifyClone.historico_reproducao hr
inner join SpotifyClone.usuario u on hr.id_usuario = u.id_usuario
inner join SpotifyClone.cancoes c on c.id_cancao = hr.id_cancao
order by `usuario`, `nome`;
