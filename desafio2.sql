use SpotifyClone;
create view estatisticas_musicais As
  SELECT count(m.albun_id) as 'cancoes',
  (select count(*) from SpotifyClone.cantores) as 'artistas',
  (select count(*) from SpotifyClone.albuns) as 'albuns'
  FROM SpotifyClone.musicas as m;
