SELECT
aa.name AS artista,
a.album_name AS album,
(
select count(*) from SpotifyClone.followers where artist_id = aa.artist_id
) AS seguidores
FROM SpotifyClone.albums a
INNER JOIN SpotifyClone.artists aa ON aa.artist_id = a.artist_id
ORDER BY
3 DESC,
1 ASC,
2 ASC;