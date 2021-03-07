CREATE VIEW estatisticas_musicais AS
SELECT 
  COUNT(DISTINCT cancoes.cancao) AS cancoes,
  COUNT(DISTINCT artistas.artista) AS artistas,
  COUNT(DISTINCT albuns.album) AS albuns
FROM SpotifyClone.cancoes AS cancoes
  INNER JOIN SpotifyClone.albuns AS albuns
  INNER JOIN SpotifyClone.artistas AS artistas;