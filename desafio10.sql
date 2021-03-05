DELIMITER $$

CREATE FUNCTION quantidade_musicas_no_historico(user_ID INT)
RETURNS INT READS SQL DATA
BEGIN
DECLARE quantidade_musicas_no_historico INT;
SELECT
COUNT(*) INTO quantidade_musicas_no_historico
FROM
User_Song AS US
JOIN User AS U ON US.user_ID = U.user_ID
WHERE
U.user_ID = user_ID;
RETURN quantidade_musicas_no_historico;
END $$

DELIMITER ;
