USE SpotifyClone;
CREATE VIEW `estatisticas_musicais` AS
SELECT
(SELECT COUNT(`nome_musica`) FROM musicas) AS cancoes,
(SELECT COUNT(`nome_artista`) FROM artistas) AS artistas,
(SELECT COUNT(`nome_album`) FROM albuns) AS albuns;
