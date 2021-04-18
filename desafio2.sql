CREATE VIEW SpotifyClone.estatisticas_musicais AS
SELECT
(SELECT COUNT(`nome_musica`) FROM SpotifyClone.musicas) AS cancoes,
(SELECT COUNT(`nome_artista`) FROM SpotifyClone.artistas) AS artistas,
(SELECT COUNT(`nome_album`) FROM SpotifyClone.albuns) AS albuns;
