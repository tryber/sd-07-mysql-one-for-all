CREATE VIEW top_3_artistas AS
SELECT a.nome AS artista,
COUNT(sa.id_usuario) AS seguidores
FROM SpotifyClone.tabela_seguindo_artistas sa
INNER JOIN SpotifyClone.tabela_artistas a
ON sa.id_artista = a.id_artista
GROUP BY sa.id_artista
ORDER BY seguidores desc, artista
LIMIT 3;
