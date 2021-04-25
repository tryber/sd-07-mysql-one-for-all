-- USE SpotifyClone;

-- DROP VIEW IF EXISTS perfil_artistas;

CREATE VIEW perfil_artistas AS
  SELECT
    si.name AS artista,
    a.name AS album,
    COUNT(DISTINCT f.user_id) AS seguidores
  FROM following AS f
  JOIN singers AS si
    ON f.singer_id = si.singer_id
  JOIN albuns AS a
    ON f.singer_id = a.singer_id
  GROUP BY a.album_id
  ORDER BY seguidores DESC, artista, album;

-- SELECT * FROM perfil_artistas;
