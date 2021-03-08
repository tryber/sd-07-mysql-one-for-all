CREATE VIEW SpotifyClone.perfil_artistas AS
SELECT
    t1.nome AS artista,
    t2.title AS album,
    COUNT(t2.id) AS seguidores
FROM SpotifyClone.Artista AS t1
    INNER JOIN SpotifyClone.Album t2 ON t2.artista_id = t1.id
    INNER JOIN SpotifyClone.UsuarioSeguindoArtista AS t3 ON t3.artista_id = t1.id
GROUP BY t2.id
ORDER BY
    seguidores DESC,
    artista,
    album;
