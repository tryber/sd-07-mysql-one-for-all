CREATE VIEW SpotifyClone.estatisticas_musicais AS
SELECT 
(SELECT COUNT(*) FROM SpotifyClone.songs) AS cancoes,
(SELECT COUNT(*) FROM SpotifyClone.artists) AS artistas,
(SELECT COUNT(*) FROM SpotifyClone.albuns) AS albuns;

/* feito com ajuda do código do @rafaelmguimaraes */
