DELIMITER $$
create procedure albuns_do_artista (in nome_artista varchar(30))
begin
select 
ar.artista_nome as artista, 
al.album_titulo as album
from SpotifyClone.artistas as ar
inner join SpotifyClone.albuns as al
on ar.artista_id = al.artista_id
where ar.artista_nome = nome_artista
order by 2;
end $$
DELIMITER ;
