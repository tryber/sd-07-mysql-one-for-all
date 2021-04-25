DELIMITER $$
CREATE TRIGGER trigger_usuario_delete
  BEFORE DELETE ON SpotifyClone.usuarios
  FOR EACH ROW
BEGIN
  DELETE FROM SpotifyClone.historico_de_reproducoes 
  WHERE SpotifyClone.historico_de_reproducoes.usuario_id = OLD.usuario_id;
  DELETE FROM SpotifyClone.usuarios_seguindo_artistas 
  WHERE SpotifyClone.usuarios_seguindo_artistas.usuario_id = OLD.usuario_id;
END $$
DELIMITER ;
