DELIMITER $$

CREATE PROCEDURE albuns_do_artista(IN nome VARCHAR(45))
BEGIN
SELECT
a.nome_artista AS artista,
al.nome_album AS album
FROM SpotifyClone.artistas AS a
INNER JOIN SpotifyClone.albuns AS al ON al.artista_id = a.artista_id
WHERE a.nome_artista = nome
ORDER BY `album`;
END

$$ DELIMITER ;

CALL albuns_do_artista('Walter Phoenix');
