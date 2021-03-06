create view historico_reproducao_usuarios as 
select 
	u.usuario_nome as usuario,
    m.musica_titulo as nome
    from SpotifyClone.historico_de_reproducao as h
    inner join SpotifyClone.usuarios as u
    on h.usuario_id = u.usuario_id
    inner join SpotifyClone.musicas as m
    on m.musica_id = h.musica_id
    order by 1,2;
