DELIMITER $$

CREATE PROCEDURE albuns_do_artista(IN artistaNome VARCHAR(45))

BEGIN
SELECT a.artista_nome AS `artista`,
  al.album_nome AS `album`
FROM SpotifyClone.artista AS a
  JOIN SpotifyClone.album AS al ON al.artista_id = a.artista_id
WHERE a.artista_nome = artistaNome
ORDER BY al.album_nome;

END ;

$$ DELIMITER ;

CALL albuns_do_artista('Walter Phoenix');
