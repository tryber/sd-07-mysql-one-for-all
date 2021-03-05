CREATE VIEW estatisticas_musicais  AS
SELECT COUNT(*) AS cancoes,
(SELECT COUNT(*) FROM SpotifyClone.artistas) as artistas,
(SELECT COUNT(*) FROM SpotifyClone.albuns) AS albuns 
FROM SpotifyClone.musicas;
