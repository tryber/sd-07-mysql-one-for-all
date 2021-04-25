CREATE VIEW perfil_artistas AS
SELECT a.nome AS artista,
al.nome AS album,
COUNT(sa.id_usuario) AS seguidores
FROM SpotifyClone.tabela_seguindo_artistas sa
INNER JOIN SpotifyClone.tabela_artistas a
ON sa.id_artista = a.id_artista
INNER JOIN SpotifyClone.tabela_albuns al
ON a.id_artista = al.id_artista
GROUP BY al.id_album
ORDER BY seguidores DESC, a.nome, al.nome;
