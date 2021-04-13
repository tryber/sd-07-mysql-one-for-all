CREATE VIEW top_3_artistas AS
SELECT
artists.artist_name 'artista', COUNT(favorites.artist_id) 'seguidores'
FROM SpotifyClone.favorites favorites
LEFT JOIN SpotifyClone.artists artists
ON artists.artist_id = favorites.artist_id
GROUP BY favorites.artist_id
ORDER BY `seguidores` DESC, `artista`
LIMIT 3;
