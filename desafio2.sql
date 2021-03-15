CREATE VIEW `estatisticas_musicais` AS
SELECT (select count(SpotifyClone.cancoes.id) from SpotifyClone.cancoes) as cancoes,
(select count(SpotifyClone.artista.id) from SpotifyClone.artista) as artitsta,
(select count(SpotifyClone.album.id) from SpotifyClone.album) as albuns;
