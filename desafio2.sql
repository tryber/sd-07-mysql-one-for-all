DROP VIEW estatisticas_musicais;
CREATE VIEW estatisticas_musicais AS 
SELECT 
COUNT(c.cancao_name) AS `cancoes`,
(SELECT COUNT(artista_name) FROM SpotifyClone.Artista) AS `artistas`,
(SELECT COUNT(album_name) FROM SpotifyClone.Albuns) AS `albuns`
FROM SpotifyClone.Cancao AS `c`;
