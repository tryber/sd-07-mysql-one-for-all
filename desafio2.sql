CREATE VIEW estatisticas_musicais AS
SELECT * FROM 
  (SELECT COUNT(cancoes.nome_cancoes) AS cancoes FROM SpotifyClone.cancoes) AS cancoes,
  (SELECT COUNT(artistas.nome_artista) AS artistas FROM SpotifyClone.artistas) AS artistas,
  (SELECT COUNT(album.nome_album) AS albuns FROM SpotifyClone.album) AS albuns;
