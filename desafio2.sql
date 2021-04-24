CREATE VIEW estatisticas_musicais AS
SELECT
(SELECT COUNT(cancao_id) FROM SpotifyClone.cancao) as cancoes,
(SELECT COUNT(artista_id) FROM SpotifyClone.artista) as artistas,
(SELECT COUNT(album_id) FROM SpotifyClone.album) as albuns
