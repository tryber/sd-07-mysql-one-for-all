CREATE VIEW estatisticas_musicais AS
SELECT COUNT(song) AS `cancoes`, (SELECT COUNT(name) FROM artists) AS `artistas`, (SELECT COUNT(cover) FROM covers) AS `albuns` 
FROM songs;
