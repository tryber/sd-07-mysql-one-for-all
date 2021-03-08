delimiter $$
CREATE TRIGGER trigger_usuario_delete
BEFORE DELETE ON SpotifyClone.tabela_usuario
FOR EACH ROW
BEGIN
DELETE FROM SpotifyClone.tabela_historico_reproducao WHERE id_usuario = old.id_usuario;
DELETE FROM SpotifyClone.tabela_seguindo_artistas WHERE id_usuario = old.id_usuario;
END $$
delimiter ;
