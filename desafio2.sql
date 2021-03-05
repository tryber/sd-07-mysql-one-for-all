CREATE VIEW estatisticas_musicais AS
SELECT COUNT(DISTINCT S.id) AS 'cancoes',
COUNT(DISTINCT AR.id) AS 'artistas',
COUNT(DISTINCT AL.id) AS 'albuns'
FROM SpotifyClone.songs as S,
SpotifyClone.artist as AR,
SpotifyClone.albuns as AL
