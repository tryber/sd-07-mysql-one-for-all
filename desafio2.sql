CREATE VIEW estatisticas_musicais AS
SELECT COUNT(DISTINCT SC.id_cancao) AS 'cancoes',
COUNT(DISTINCT SA.id_artista) AS 'artistas',
COUNT(DISTINCT SAL.id_album) AS 'albuns'
FROM SpotifyClone.cancoes AS SC
INNER JOIN SpotifyClone.artistas AS SA
INNER JOIN SpotifyClone.albuns AS SAL;
