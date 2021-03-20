CREATE VIEW estatisticas_musicais AS
SELECT (
  SELECT count(cancoes_id) as 'cancoes'
  FROM SpotifyClone.songs  
) as cancoes, 
(
  SELECT count(artista_id) as 'artistas'
  FROM SpotifyClone.artists
) as artistas, 
(
  SELECT count(album_id) as 'albuns'
  FROM SpotifyClone.albums
) as albuns;
