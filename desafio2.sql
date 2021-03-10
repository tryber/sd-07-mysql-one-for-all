USE SpotifyClone;

CREATE VIEW estatisticas_musicais AS
  SELECT
    COUNT(DISTINCT(cancao.cancao_id)) AS cancoes,
    COUNT(DISTINCT(artista.artista_id)) AS artistas,
    COUNT(DISTINCT(album.album_id)) as albuns
    FROM cancao AS cancao,
    artista AS artista,
    album AS album;
