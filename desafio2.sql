CREATE VIEW estatisticas_musicais AS 
  SELECT COUNT(DISTINCT(S.song_id)) AS cancoes, COUNT(DISTINCT(Art.artist_id)) AS artistas, COUNT(DISTINCT(A.album_id)) AS albuns
  FROM SpotifyClone.Songs AS S
  INNER JOIN SpotifyClone.Album AS A
  ON S.album_id = A.album_id
  INNER JOIN SpotifyClone.Artists AS Art
  ON A.artist_id = Art.artist_id;
