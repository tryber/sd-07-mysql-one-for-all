USE SpotifyClone;
CREATE VIEW count_tracks_artists_albums AS
SELECT COUNT(nome) AS cancoes,
(SELECT COUNT(nome) FROM artistas) AS artistas,
(SELECT COUNT(nome) FROM albums) AS albuns
FROM cancoes;
