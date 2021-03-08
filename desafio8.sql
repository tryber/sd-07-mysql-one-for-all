DELIMITER $$
CREATE trigger trigger_usuario_delete
before delete on SpotifyClone.usuarios
for each row
begin
delete from SpotifyClone.historico_de_reproducao 
where usuario_id = old.usuario_id;
delete from SpotifyClone.historico_de_seguidores
where usuario_id = old.usuario_id;
end $$
DELIMITER ;
