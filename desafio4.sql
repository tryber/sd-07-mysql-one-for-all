CREATE VIEW SpotifyClone.top_3_artistas AS
SELECT a.artista_nome AS `artista`,
    COUNT(*) AS `seguidores`
FROM SpotifyClone.seguindo AS s
    JOIN SpotifyClone.usuario AS u ON u.usuario_id = s.usuario_id
    JOIN SpotifyClone.artista AS a ON a.artista_id = s.artista_id
GROUP BY a.artista_id
ORDER BY `seguidores` DESC,
    `artista`
LIMIT 3;
