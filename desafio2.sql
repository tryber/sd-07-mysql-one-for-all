use SpotifyClone;
create view estatisticas_musicais As
  SELECT (select count(albun_id) from SpotifyClone.musicas) as 'cancoes',
  (select count(*) from SpotifyClone.cantores) as 'artistas',
  (select count(*) from SpotifyClone.albuns) as 'albuns'
