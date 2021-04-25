CREATE VIEW perfil_artistas AS SELECT
A.artista_nome AS artista, 
Al.album_nome AS album, 
COUNT(fk_usuario_id) AS seguidores
FROM Artistas AS A
INNER JOIN Artistas_Seguidores AS S
ON S.fk_artista_id = A.artista_id
INNER JOIN Albuns AS Al
ON Al.fk_artista_id =  S.fk_artista_id
GROUP BY A.artista_nome, Al.album_nome
ORDER BY seguidores DESC, 
artista ASC, 
album ASC;
