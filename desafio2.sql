CREATE VIEW estatisticas_musicais AS
SELECT COUNT(c.id_cancao) "cancoes",
COUNT(DISTINCT c.id_artista) "artistas",
COUNT(DISTINCT c.id_album) "albuns"
FROM SpotifyClone.tabela_cancoes c;