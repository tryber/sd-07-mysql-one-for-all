CREATE VIEW estatisticas_musicais AS
SELECT
COUNT(DISTINCT MU.idmusicas) AS `cancoes`,
COUNT(DISTINCT AR.idartistas) AS `artistas`,
COUNT(DISTINCT AL.idalbum) AS `albuns`
FROM album AL, musicas MU,  artistas AR;
