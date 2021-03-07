USE SpotifyClone;
DELIMITER $$ CREATE FUNCTION quantidade_musicas_no_historico(usuario VARCHAR(255)) RETURNS INT READS SQL DATA BEGIN
DECLARE tamanho_do_historico INT;
SELECT COUNT(usuario_nome) AS quantidade_musicas_no_historico
FROM SpotifyClone.usuarios AS table_usuarios
  INNER JOIN SpotifyClone.historico AS table_historico ON table_usuarios.usuario_id = table_historico.usuario_id
WHERE usuario_nome = usuario INTO tamanho_do_historico;
RETURN tamanho_do_historico;
END $$ DELIMITER;
