CREATE VIEW estatisticas_musicais AS
   SELECT COUNT(nome) AS "cancoes",
	(SELECT COUNT(*) FROM SpotifyClone.artistas) "artistas",
	(SELECT COUNT(*) FROM SpotifyClone.albuns) "albuns"
	FROM SpotifyClone.cancoes c;