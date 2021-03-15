use SpotifyClone;

DELIMITER $$

CREATE TRIGGER trigger_usuario_delete
BEFORE  DELETE ON usuario
FOR EACH ROW
BEGIN
   DELETE FROM historico_de_reproducoes
   WHERE OLD.usuario_id = historico_de_reproducoes.usuario_id;
DELETE FROM seguindo_artista
WHERE
    OLD.usuario_id = seguindo_artista.usuario_id;
END $$

DELIMITER ;
