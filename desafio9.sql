USE SpotifyClone;
DELIMITER $$ CREATE PROCEDURE albuns_do_artista(IN nome_artista VARCHAR(255)) BEGIN
SELECT artista_nome AS artista,
  table_albuns.album_nome AS album
FROM SpotifyClone.artistas AS table_artistas
  INNER JOIN SpotifyClone.albuns AS table_albuns ON table_artistas.artista_id = table_albuns.artista_id
HAVING artista_nome = nome_artista
ORDER BY album;
END $$ DELIMITER;
