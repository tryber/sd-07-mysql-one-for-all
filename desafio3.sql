CREATE VIEW historico_reproducao_usuarios as
select
(
select user_name from SpotifyClone.users where user_id = p.user_id
) as 'usuario',
(
select song_title from SpotifyClone.songs where song_id = p.song_id
) as 'nome'
from SpotifyClone.plays p
order by
1 ASC,
2 ASC;
