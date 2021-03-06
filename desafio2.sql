CREATE VIEW estatisticas_musicais AS
SELECT (SELECT COUNT(A.cancao_id) FROM SpotifyClone.cancoes A) cancoes,
(SELECT COUNT(B.artista_id) artistas FROM SpotifyClone.artistas B) artistas,    
(SELECT COUNT(C.album_id) albuns FROM SpotifyClone.albuns C) albuns;
