CREATE VIEW estatisticas_musicais
AS SELECT COUNT(son_id) AS 'cancoes',
(SELECT COUNT(*) FROM SpotifyClone.Singers) AS 'artistas',
(SELECT COUNT(*) FROM SpotifyClone.Albums) AS 'albuns'
FROM SpotifyClone.Songs;
