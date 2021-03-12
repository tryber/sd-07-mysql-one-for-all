USE SpotifyClone
DELIMITER $$

CREATE TRIGGER trigger_usuario_delete
AFTER DELETE ON usuario
FOR EACH ROW
BEGIN
  delete from historico_reproducao where id_usuario = old.id_usuario
  delete from seguindo_artistas where id_usuario = old.id_usuario
END
DELIMITER $$ ;
