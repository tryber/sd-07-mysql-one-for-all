
DELIMITER $$

CREATE FUNCTION quantidade_musicas_no_historico(id INT)
RETURNS INT READS SQL DATA
BEGIN
DECLARE qnt_music INT;
SELECT COUNT(cancao_id)
FROM SpotifyClone.historico_de_reproducoes
WHERE usuario_id = id INTO qnt_music;
RETURN qnt_music;
END $$

DELIMITER ;