USE SpotifyClone;

CREATE VIEW estatisticas_musicais AS
SELECT COUNT(musica_id) AS cancoes,
(SELECT COUNT(artista_id) FROM SpotifyClone.artists) AS artistas,
(SELECT COUNT(album_id) FROM SpotifyClone.albums) AS albuns
FROM SpotifyClone.songs;
