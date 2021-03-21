USE SpotifyClone;
DELIMITER $$

-- feedback sobre esta questão. achei o enunciado confuso e estava tentando passar como string o parâmetro da função, visto que é o que dá a entender na descrição do desafio
CREATE FUNCTION quantidade_musicas_no_historico(codigo_usuario INT)
RETURNS INT READS SQL DATA
BEGIN
DECLARE countPlayedSongs INT;
SELECT COUNT(dbh.cancoes_id)
FROM SpotifyClone.historico_de_reproducoes AS dbh
WHERE dbh.usuario_id = codigo_usuario
INTO countPlayedSongs;
RETURN countPlayedSongs;
END $$

DELIMITER ;
