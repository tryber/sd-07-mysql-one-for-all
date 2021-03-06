USE SpotifyClone;
DELIMITER $$
CREATE PROCEDURE quantidade_musicas_no_historico(IN id INT)
BEGIN
SELECT COUNT(*) AS quantidade_musicas_no_historico 
from historico 
WHERE usuario_id = id;
END $$
DELIMITER ;
