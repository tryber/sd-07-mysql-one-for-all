DELIMITER $
CREATE FUNCTION quantidade_musicas_no_historico (F_id_user INT)
RETURNS INT DETERMINISTIC
BEGIN
    DECLARE qty INT;
    SELECT COUNT(*) INTO qty
    FROM historic 
    WHERE id_user = F_id_user;
    RETURN qty;
END
$
DELIMITER ;
