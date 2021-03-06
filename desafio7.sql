CREATE VIEW chamada perfil_artistas AS
SELECT
  SpotifyClone.singers.name AS "artista",
  SpotifyClone.albuns.name AS "album",
  COUNT(SpotifyClone.following_artists.artist_id) AS "seguidores"
FROM SpotifyClone.singers
JOIN SpotifyClone.albuns
ON albuns.artist_id = singers.id
JOIN SpotifyClone.following_artists
ON SpotifyClone.following_artists.artist_id = SpotifyClone.singers.id
GROUP BY albuns.id
ORDER BY seguidores DESC, artista, album;
