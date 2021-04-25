CREATE VIEW top_3_artistas AS
SELECT
A.name_singer AS 'artista',
COUNT(UA.artistas_idartistas) AS 'seguidores'
FROM SpotifyClone.usuario_artistas UA
JOIN artistas A ON UA.artistas_idartistas = A.idartistas
GROUP BY UA.artistas_idartistas
ORDER BY COUNT(UA.artistas_idartistas) DESC, A.name_singer
LIMIT 3;
