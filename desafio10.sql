DELIMITER $$
CREATE PROCEDURE quantidade_musicas_no_historico(IN id INT)
BEGIN
SELECT COUNT(*) AS quantidade_musicas_no_historico 
from SpotifyClone.historico 
WHERE usuario_id = id;
END $$
DELIMITER ;
