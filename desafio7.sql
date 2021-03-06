CREATE VIEW perfil_artistas AS
SELECT
  ARTISTAS.artista,
  ALBUNS.album,
  COUNT(ALBUNS.albun_id) AS 'seguidores'
FROM SpotifyClone.albuns AS ALBUNS
INNER JOIN SpotifyClone.artistas AS ARTISTAS
ON ARTISTAS.artista_id = ALBUNS.artista_id
INNER JOIN SpotifyClone.usuarios_seguindo_artistas AS SEGUIDORES
ON SEGUIDORES.artista_id = ALBUNS.artista_id
GROUP BY ALBUNS.albun_id
ORDER BY 3 DESC, 1, 2;
