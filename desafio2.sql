create view estatisticas_musicais as select
(select count(*) from SpotifyClone.cancoes) as cancoes,
(select count(*) from SpotifyClone.artistas) as artistas,
(select count(*) from SpotifyClone.albuns) as albuns;
