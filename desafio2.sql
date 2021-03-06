SELECT COUNT(table_cancoes.cancao_id) AS "cancoes",
  (
    SELECT COUNT(table_artistas.artista_id)
    FROM SpotifyClone.artistas AS table_artistas
  ) AS "artistas",
  (
    SELECT COUNT(table_albuns.album_id)
    FROM SpotifyClone.albuns AS table_albuns
  ) AS "albuns"
FROM SpotifyClone.cancoes AS table_cancoes;
