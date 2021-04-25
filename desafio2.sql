CREATE VIEW estatisticas_musicais AS SELECT
(SELECT COUNT(C.cancao_id) FROM SpotifyClone.Cancoes AS C) AS cancoes,
(SELECT COUNT(A.artista_id) FROM SpotifyClone.Artistas AS A) AS artistas,
(SELECT COUNT(Al.album_id) FROM  SpotifyClone.Albuns AS Al) AS albuns;
