CREATE VIEW estatisticas_musicais AS
SELECT COUNT(nome) AS cancoes,
(SELECT COUNT(nome) FROM artistas) AS artistas,
(SELECT COUNT(nome) FROM albums) AS albuns
FROM cancoes;
