DELIMITER $$
CREATE FUNCTION quantidade_musicas_no_historico(id int)
RETURNS INT READS SQL DATA
BEGIN
    DECLARE quantidade_musica INT;
    SELECT COUNT(hr.usuario_id)
    FROM historico_reproducao hr
    WHERE hr.usuario_id = id INTO quantidade_musica;
    RETURN quantidade_musica;
END $$
DELIMITER ;
