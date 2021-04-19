CREATE VIEW SpotifyClone.estatisticas_musicais AS 
SELECT ( 
SELECT COUNT(musica_nome)
FROM SpotifyClone.musicas) AS "cancoes",
( 
SELECT COUNT(artista_nome)
FROM SpotifyClone.artistas) AS "artistas",
( 
SELECT COUNT(album_nome)
FROM SpotifyClone.albuns) AS "albuns";
