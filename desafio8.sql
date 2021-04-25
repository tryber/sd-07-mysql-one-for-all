DELIMITER $$
CREATE TRIGGER trigger_usuario_delete2
before delete on SpotifyClone.usuarios
for each row
begin
  delete FROM SpotifyClone.historiocos
  where usuario_id = OLD.usuario_id;
  delete FROM SpotifyClone.seguidores
  where usuario_id = OLD.usuario_id;
end $$
DELIMITER ;
