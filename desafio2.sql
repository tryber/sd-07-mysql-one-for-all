create view estatisticas_musicais as
select
	count(distinct m.musica_id) as 'cancoes',
    count(distinct ar.artista_id) as 'artistas',
    count(distinct al.album_id) as 'albuns'
    from SpotifyClone.musicas as m 
    INNER JOIN SpotifyClone.artistas as ar
    on m.artista_id = ar.artista_id
    inner join SpotifyClone.albuns as al
    on al.artista_id = ar.artista_id;
