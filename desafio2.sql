create view estatisticas_musicais as
select
(select count(cancoe_id ) from SpotifyClone.cancoes) as cancoes,
(select count(artista_id) from SpotifyClone.artistas) as artistas,
(select count(album_id) from SpotifyClone.albums) as albuns;
