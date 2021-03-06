-- SELECT usuario_id, COUNT(cancao_id) FROM SpotifyClone.historico
-- GROUP BY usuario_id;

-- USE SpotifyClone;
-- DELIMITER $$

-- CREATE FUNCTION quantidade_musicas_no_historico(id_do_usuario INT)
-- RETURNS INT READS SQL DATA
-- BEGIN
--     DECLARE musicas_historico INT;
--     SELECT usuario_id, COUNT(cancao_id) FROM SpotifyClone.historico
-- 	GROUP BY usuario_id
--     HAVING historico.usuario_id = id_do_usuario INTO musicas_historico;
--     RETURN musicas_historico;
-- END $$

-- DELIMITER ;
