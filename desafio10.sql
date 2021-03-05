delimiter $$

create function quantidade_musicas_no_historico(usuarioID int)
returns int reads sql data
begin
declare quantidade_de_musicas int;
select count(*) from SpotifyClone.reproducoes as rep
inner join SpotifyClone.usuarios as usu on usu.usuario_id = rep.usuario_id
where usu.usuario_id = usuarioID into quantidade_de_musicas;
return quantidade_de_musicas;
end $$

delimiter ;
