CREATE VIEW estatisticas_musicais AS
  SELECT COUNT(c.cancao) AS cancoes,
  COUNT(DISTINCT art.artista) AS artistas,
  COUNT(DISTINCT alb.album) AS albuns
  FROM SpotifyClone.albuns alb
  INNER JOIN SpotifyClone.cancoes c ON alb.id = c.album_id
  INNER JOIN SpotifyClone.artistas art ON art.id = alb.artista_id;
