CREATE VIEW estatisticas_musicais AS
SELECT COUNT(DISTINCT S.song_id) AS cancoes,
COUNT(DISTINCT AR.artist_id) AS artistas,
COUNT(DISTINCT AL.album_id) AS albuns
FROM SpotifyClone.songs AS S
JOIN SpotifyClone.artists AS AR
JOIN SpotifyClone.albums AS AL;
