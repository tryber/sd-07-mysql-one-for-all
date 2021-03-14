CREATE VIEW estatisticas_musicais AS (
-- Referência do DISTINCT: https://github.com/tryber/sd-07-mysql-one-for-all/blob/ANDREHORMAN-MySQL-One-For-All/desafio2.sql
SELECT DISTINCT
COUNT(SONGS.song_id) AS cancoes,
COUNT(DISTINCT SINGERS.singer_id) AS artistas,
COUNT(DISTINCT ALBUNS.album_id) AS albuns
FROM
SpotifyClone.songs SONGS
LEFT JOIN SpotifyClone.singers SINGERS ON SONGS.singer_id = SINGERS.singer_id
LEFT JOIN SpotifyClone.albuns ALBUNS ON SONGS.album_id = ALBUNS.album_id
);