CREATE VIEW top_3_artistas AS
	SELECT
        t1.nome AS 'artista',
        COUNT(t2.usuario_id) AS 'seguidores'
    FROM
        SpotifyClone.artistas AS t1
            INNER JOIN
        SpotifyClone.seguindo_artistas AS t2 ON t1.artista_id = t2.artista_id
GROUP BY t1.nome
ORDER BY `seguidores` DESC, t1.nome
LIMIT 3;
 