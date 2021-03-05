CREATE VIEW estatisticas_musicais AS
SELECT
  (SELECT COUNT(song_id) FROM SpotifyClone.songs) AS cancoes,
  (SELECT COUNT(name_singer) FROM SpotifyClone.singers) AS artistas,
  (SELECT COUNT(album_id) FROM SpotifyClone.album) AS albuns;
 