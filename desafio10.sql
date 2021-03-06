-- Desafio 10
-- Crie uma function chamada de quantidade_musicas_no_historico que exibe a quantidade de músicas que estão presentes 
-- atualmente no histórico de reprodução de uma pessoa usuária. Ao receber o código identificador da pessoa, exiba a quantidade 
-- de canções em seu histórico de reprodução.

DELIMITER $$

CREATE FUNCTION SpotifyClone.quantidade_musicas_no_historico(usuario varchar(100))
RETURNS INT READS SQL DATA
BEGIN
DECLARE ID_USUARIO_PROCURADO INT;
DECLARE TOTAL INT;

SELECT U.ID
FROM usuarios AS U
WHERE
U.nome = usuario
INTO ID_USUARIO_PROCURADO;

SELECT COUNT(R.id_usuario)
FROM reproducoes R
WHERE R.id_usuario = ID_USUARIO_PROCURADO
INTO TOTAL;

RETURN TOTAL;
END $$

DELIMITER ;
