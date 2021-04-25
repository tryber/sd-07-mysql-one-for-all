DELIMITER $$
CREATE PROCEDURE albuns_do_artista(in artista varchar(100))
begin
  select concat(c.nome, ' ', c.sobreNome) as 'artista',
  a.nome as 'album'
  from SpotifyClone.cantores as c
  inner join SpotifyClone.albuns as a
  on c.cantor_id = a.cantor_id
  where concat(c.nome, ' ', c.sobreNome) = artista
  ;
end $$
DELIMITER ;
