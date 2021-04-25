CREATE VIEW SpotifyClone.estatisticas_musicais AS
SELECT COUNT(distinct songs.cancoes) AS cancoes,
COUNT(distinct artistas.artista) AS artistas,
COUNT( distinct albuns.album_id) AS albuns
FROM SpotifyClone.songs
INNER JOIN SpotifyClone.albuns
ON songs.album_id = albuns.album_id
INNER JOIN SpotifyClone.artistas
ON albuns.artista_id = artistas.artista_id;
