CREATE VIEW top_3_artistas AS
SELECT a.`artist` AS `artista`,
count(af.artist_id)  as `seguidores`
FROM SpotifyClone.artists a
INNER JOIN SpotifyClone.artists_followed af ON a.artist_id = af.artist_id
group by `artista`
order by `seguidores` desc, `artista`
limit 3;