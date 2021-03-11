use SpotifyClone
delimiter $$
create trigger trigger_usuario_delete
before delete on usuarios
for each row
begin
delete from seguindo
where old.usuario_id = seguindo.usuario_id;
delete from reproducoes
where old.usuario_id = reproducoes.usuario_id;
end $$
delimiter ;
