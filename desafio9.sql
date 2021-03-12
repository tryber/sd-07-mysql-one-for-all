USE SpotifyClone;
DELIMITER $$

CREATE PROCEDURE albuns_do_artista(IN nomeDoArtista VARCHAR(50))
BEGIN
select a.nome_artista as artista,
al.album as album
from SpotifyClone.artistas a
inner join SpotifyClone.albuns al on al.id_artista = a.id_artista
where nomeDoArtista = a.nome_artista;
END $$
DELIMITER ;
