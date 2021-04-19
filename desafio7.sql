CREATE VIEW perfil_artistas AS
SELECT a.artist AS `artista`,
al.album as `album`,
count(f.user_id) as `seguidores`
FROM SpotifyClone.artists a
INNER JOIN SpotifyClone.albums al ON a.artist_id = al.artist_id
INNER JOIN SpotifyClone.artists_followed f ON a.artist_id = f.artist_id
group by `artista`, `album`
order by `seguidores` desc, `artista`, `album`;
-- Reforçar group by que ainda está pregando peças.
