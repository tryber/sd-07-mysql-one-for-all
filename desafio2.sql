CREATE VIEW `estatisticas_musicais` AS SELECT
(SELECT COUNT(CAN.cancao_id) FROM SpotifyClone.cancoes AS CAN) AS `cancoes`,
(SELECT COUNT(ART.artista_id) FROM SpotifyClone.artistas AS ART) AS `artistas`,
(SELECT COUNT(ALB.album_id) FROM  SpotifyClone.albuns AS ALB) AS `albuns`;
