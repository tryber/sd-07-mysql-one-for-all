use SpotifyClone;
delimiter $$
create procedure albuns_do_artista (in nome varchar(50))
begin
	select ar.artista as artista,
    al.album as album
    from SpotifyClone.albums as al
    inner join SpotifyClone.artistas as ar on ar.artista_id = al.artista_id
    where ar.artista  = nome
    order by album;
end $$
delimiter ;
