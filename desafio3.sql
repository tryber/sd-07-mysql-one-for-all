CREATE VIEW historico_reproducao_usuarios as
select
(
select user_name from users where user_id = p.user_id
) as 'usuario',
(
select song_title from songs where song_id = p.song_id
) as 'nome'
from plays p
order by
1 ASC,
2 ASC;
