use SpotifyClone;
CREATE VIEW historico_reproducao_usuarios as
select
u.user_name as 'usuario',
s.song_title as 'nome'
from SpotifyClone.plays p
inner join SpotifyClone.users u on u.user_id = p.user_id
inner join SpotifyClone.songs s on s.song_id = p.song_id
order by
1 ASC,
2 ASC;
