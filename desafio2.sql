CREATE VIEW estatisticas_musicais AS
SELECT
(SELECT COUNT(song_id) FROM songs s) AS 'cancoes',
(SELECT COUNT(artist_id) FROM artist) AS 'artistas',
(SELECT COUNT(album_id) FROM album) AS 'albuns'
;
