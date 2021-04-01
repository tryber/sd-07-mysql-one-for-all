CREATE VIEW perfil_artistas AS
  SELECT artistaseguido.nome_artista AS artista, album.nome_album AS album,
  COUNT(seguidorartista.artista_id) AS seguidores
  FROM SpotifyClone.artistas AS artistaseguido
    INNER JOIN SpotifyClone.usuario_artista AS seguidorartista
      ON artistaseguido.artista_id = seguidorartista.artista_id
    INNER JOIN SpotifyClone.album AS album
      ON album.artista_id = artistaseguido.artista_id
    GROUP BY artista, album
    ORDER BY seguidores DESC, artista ASC, album ASC;
