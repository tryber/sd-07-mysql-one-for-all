CREATE VIEW SpotifyClone.top_3_artistas AS
SELECT
    t1.nome AS artista,
    COUNT(t2.usuario_id) AS seguidores
FROM SpotifyClone.Artista AS t1
    INNER JOIN SpotifyClone.UsuarioSeguindoArtista t2 ON t1.id = t2.artista_id
GROUP BY t1.nome
ORDER BY
    seguidores desc,
    artista
LIMIT 3;
