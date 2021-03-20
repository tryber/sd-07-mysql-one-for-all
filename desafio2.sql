CREATE VIEW estatisticas_musicais AS
SELECT (
  SELECT count(cancoes_id)
  FROM SpotifyClone.songs  
) as cancoes, 
(
  SELECT count(artista_id)
  FROM SpotifyClone.artists
) as artistas, 
(
  SELECT count(album_id)
  FROM SpotifyClone.albums
) as albuns;
