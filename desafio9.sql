USE SpotifyClone;
DELIMITER $$

CREATE PROCEDURE albuns_do_artista(in selectedArtist varchar(100))
BEGIN
select a.artist as `artista`,
  al.album as `album`
  from SpotifyClone.artists a
  inner join SpotifyClone.albums al
  on a.artist_id = al.artist_id
  where a.artist = selectedArtist
  order by 2;
END $$

DELIMITER ;
