CREATE VIEW estatisticas_musicais AS
SELECT COUNT(M.id_musica) AS `cancoes`,
COUNT(DISTINCT AL.id_artista) AS `artistas`,
COUNT(DISTINCT M.id_album) AS `albuns`
FROM SpotifyClone.album AS AL
INNER JOIN SpotifyClone.musicas AS M ON M.id_album = AL.id_album;
