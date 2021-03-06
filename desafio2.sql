CREATE VIEW estatisticas_musicais AS
  SELECT FORMAT(SUM(Number_of_songs), 0) AS cancoes, FORMAT(COUNT(artist_id),0) AS artistas, FORMAT(SUM(albuns),0) AS albuns FROM(
  SELECT C.Number_of_songs, C.artist_id, COUNT(Album.album_id) AS albuns FROM(
  SELECT COUNT(Songs.song_name) AS Number_of_songs, Artists.artist_id
  FROM SpotifyClone.Songs AS Songs
  INNER JOIN SpotifyClone.Album AS Album
  ON Songs.album_id = Album.album_id
  INNER JOIN SpotifyClone.Artists AS Artists
  ON Album.artist_id = Artists.artist_id
  GROUP BY Artists.artist_id) AS C
  INNER JOIN SpotifyClone.Album AS Album
  ON C.artist_id = Album.artist_id
  GROUP BY C.artist_id) AS C2;
