CREATE VIEW SpotifyClone.perfil_artistas AS
SELECT a.artista_nome AS `artista`,
    al.album_nome AS `album`,
    COUNT(*) AS `seguidores`
FROM SpotifyClone.seguindo AS s
    JOIN SpotifyClone.usuario AS u ON u.usuario_id = s.usuario_id
    JOIN SpotifyClone.artista AS a ON a.artista_id = s.artista_id
    JOIN SpotifyClone.album AS al ON al.artista_id = a.artista_id
GROUP BY al.album_id
ORDER BY `seguidores` DESC,
    `artista`,
    `album`;
