USE SpotifyClone;
CREATE VIEW estatisticas_musicais AS
SELECT
  (SELECT COUNT(musicas.musica) FROM SpotifyClone.musicas) AS "cancoes",
  (SELECT COUNT(artistas.artista) FROM SpotifyClone.artistas) AS "artistas",
  (SELECT COUNT(albuns.album) FROM SpotifyClone.albuns) AS "albuns";
