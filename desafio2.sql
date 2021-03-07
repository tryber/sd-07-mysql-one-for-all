CREATE VIEW estatiscas_musicais AS
SELECT COUNT(s.song) AS cancoes,
(SELECT COUNT(ar.artist) FROM SpotifyClone.artists AS ar) AS artistas,
(SELECT COUNT(al.album) FROM SpotifyClone.albuns AS al) AS albuns
FROM SpotifyClone.songs AS s;
