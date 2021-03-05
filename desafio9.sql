delimiter $$

create procedure albuns_do_artista(in nome_do_artista varchar(30))
begin
select art.artista, alb.album from SpotifyClone.albuns as alb
inner join SpotifyClone.artistas as art on alb.artista_id = art.artista_id
where art.artista = nome_do_artista order by alb.album;
end $$

DELIMITER ;
