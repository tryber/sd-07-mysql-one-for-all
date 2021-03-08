CREATE VIEW estatisticas_musicais artista_id
SELECT
(SELECT COUNT(*) FROM SpotifyClone.cancoes) AS 'cancoes',
(SELECT COUNT(*) FROM SpotifyClone.artistas) AS 'artistas',
(SELECT COUNT(*) FROM SpotifyClone.albuns) AS 'albuns';
