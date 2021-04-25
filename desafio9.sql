-- USE SpotifyClone;

-- DROP PROCEDURE IF EXISTS albuns_do_artista;

DELIMITER $$

CREATE PROCEDURE albuns_do_artista(IN singer VARCHAR(50))
  BEGIN
    SELECT
      si.name AS artista,
      a.name AS album
    FROM singers AS si
    JOIN albuns AS a
      ON si.singer_id = a.singer_id
    WHERE si.name LIKE CONCAT('%', singer, '%');
    
  END $$

DELIMITER ;

-- CALL albuns_do_artista('Walter Phoenix');
