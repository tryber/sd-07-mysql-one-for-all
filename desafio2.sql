CREATE VIEW estatisticas_musicais AS 
SELECT 
(SELECT COUNT(cancao_name) FROM SpotifyClone.Cancao) AS `cancoes`,
(SELECT COUNT(artista_name) FROM SpotifyClone.Artista) AS `artistas`,
(SELECT COUNT(album_name) FROM SpotifyClone.Albuns) AS `albuns`;
