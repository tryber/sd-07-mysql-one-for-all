CREATE VIEW estatisticas_musicais AS
SELECT COUNT(DISTINCT(CAN.cancao_id)) cancoes,
COUNT(DISTINCT(ART.nome_artista)) artistas,
COUNT(DISTINCT(ALB.nome_album)) albuns
FROM SpotifyClone.cancoes CAN
INNER JOIN SpotifyClone.artistas ART
ON CAN.artista_id = ART.artista_id
INNER JOIN SpotifyClone.album ALB
ON CAN.album_id = ALB.album_id;
