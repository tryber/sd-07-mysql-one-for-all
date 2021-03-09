CREATE VIEW estatisticas_musicais AS
SELECT 
COUNT(DISTINCT C.cancao) AS 'cancoes',
COUNT(DISTINCT A.artista) AS 'artistas',
COUNT(DISTINCT AL.album) AS 'albuns'  
FROM SpotifyClone.albuns as AL
INNER JOIN SpotifyClone.cancoes AS C
ON C.album_id = AL.album_id
INNER JOIN SpotifyClone.artistas AS A
ON A.artista_id = AL.artista_id;
