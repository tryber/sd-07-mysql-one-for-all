CREATE view estatisticas_musicais AS
  SELECT count(albun_id) AS 'cancoes',
  (SELECT count(cantor_id) FROM SpotifyClone.cantores) AS 'artistas',
  (SELECT count(albun_id) FROM SpotifyClone.albuns) AS 'albuns'
  FROM SpotifyClone.musicas;
