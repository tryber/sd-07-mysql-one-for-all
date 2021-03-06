-- Desafio 9
-- Crie uma procedure chamada albuns_do_artista que recebe como parâmetro o nome de uma pessoa artista e em retorno deve exibir as seguintes colunas:
-- O nome da pessoa artista, com o alias "artista".
-- O nome do álbum, com o alias "album".
-- Os resultados devem ser ordenados pelo nome do álbum em ordem alfabética.
-- Confirme a execução correta da procedure, chamando-a e passando o nome igual a "Walter Phoenix". 
-- Sua procedure deve retornar o mesmo que o resultado abaixo:
-- CALL albuns_do_artista('Walter Phoenix');

USE SpotifyClone;
DELIMITER $$

CREATE PROCEDURE albuns_do_artista(IN artista VARCHAR(100))
BEGIN
DECLARE ID_ARTISTA_PROCURADO INT;

SELECT A.id
FROM artistas AS A
WHERE A.nome LIKE artista
INTO ID_ARTISTA_PROCURADO;

SELECT artista, AB.nome as "album"
FROM albuns AS AB
INNER JOIN artistas as A ON A.id = AB.id_artista
WHERE AB.id_artista = ID_ARTISTA_PROCURADO
ORDER BY 2;
END $$

DELIMITER ;
