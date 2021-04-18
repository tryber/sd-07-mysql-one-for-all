CREATE VIEW `historico_reproducao_usuarios` AS
select
-- SpotifyClone.historico.id,
-- SpotifyClone.historico.cancoes_id,
-- SpotifyClone.historico.usuario_id,
SpotifyClone.usuario.usuario as usuario,
SpotifyClone.cancoes.cancoes as nome
from SpotifyClone.historico
inner join SpotifyClone.cancoes
on SpotifyClone.historico.cancoes_id = SpotifyClone.cancoes.id
inner join SpotifyClone.usuario
on SpotifyClone.historico.usuario_id = SpotifyClone.usuario.id
order by 1, 2;
