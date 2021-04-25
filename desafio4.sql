CREATE VIEW SpotifyClone.top_3_artistas AS
SELECT art.artista AS `artista`,
COUNT(sArt.artista) AS `seguidores`
FROM SpotifyClone.artistas AS art
INNER JOIN SpotifyClone.seguindo_artista AS sArt
ON art.artista_id = sArt.artista
GROUP BY art.artista
ORDER BY seguidores DESC, artista
LIMIT 3;
