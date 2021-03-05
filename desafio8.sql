delimiter $$

create trigger trigger_usuario_delete
before delete on SpotifyClone.usuarios
for each row
begin
delete from SpotifyClone.reproducoes where usuario_id = old.usuario_id;
delete from SpotifyClone.seguindo where usuario_id = old.usuario_id;
end $$

delimiter ;
