DELIMITER $$

CREATE PROCEDURE albuns_do_artista(IN artista VARCHAR(200))
BEGIN
SELECT CONCAT(A.nome, ' ', A.sobrenome) artista, B.album album
FROM SpotifyClone.artistas A, SpotifyClone.albuns B
WHERE A.artista_id=B.artista_id AND CONCAT(A.nome, ' ', A.sobrenome)=artista
ORDER BY album;
END $$

DELIMITER ;
