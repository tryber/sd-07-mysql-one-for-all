CREATE VIEW top_2_hits_do_momento AS
SELECT c.cancao, COUNT(uc.usuario_id) AS reproducoes
FROM SpotifyClone.usuario_cancao AS uc
INNER JOIN SpotifyClone.cancoes AS c ON uc.cancao_id = c.cancao_id
GROUP BY c.cancao_id
ORDER BY reproducoes DESC, c.cancao
LIMIT 2;
