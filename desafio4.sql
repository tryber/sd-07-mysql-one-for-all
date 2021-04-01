CREATE VIEW top_3_artistas AS
  SELECT artistaseguido.nome_artista AS artista, COUNT(seguidorartista.artista_id) AS seguidores
  FROM SpotifyClone.artistas AS artistaseguido
    INNER JOIN SpotifyClone.usuario_artista AS seguidorartista
      ON artistaseguido.artista_id = seguidorartista.artista_id
    GROUP BY artista
    ORDER BY seguidores DESC, artista ASC LIMIT 3;
