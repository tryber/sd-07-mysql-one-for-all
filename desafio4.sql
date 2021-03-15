CREATE VIEW `top_3_artistas` AS
SELECT
count(SpotifyClone.seguindo.usuario_id) as seguidores,
SpotifyClone.artista.artista as artista
FROM SpotifyClone.seguindo
inner join SpotifyClone.artista
on SpotifyClone.seguindo.artista_id = SpotifyClone.artista.id
group by artista_id
order by 1 desc, 2
limit 3;
