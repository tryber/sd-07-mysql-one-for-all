DELIMITER $$
CREATE TRIGGER trigger_usuario_delete
BEFORE DELETE ON SpotifyClone.usuario
FOR EACH ROW
BEGIN
DELETE FROM SpotifyClone.usuario_artistas WHERE SpotifyClone.artistas_idartistas = OLD.artistas_idartistas;
DELETE FROM SpotifyClone.usuario_musicas WHERE SpotifyClone.usuario_idusuario = OLD.usuario_idusuario;
END; $$
