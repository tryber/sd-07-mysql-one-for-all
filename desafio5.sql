CREATE VIEW top_2_hits_do_momento AS
SELECT C.nome AS cancao,
COUNT(UC.usuario_id) AS reproducoes
FROM SpotifyClone.usuarios_cancoes AS UC
INNER JOIN SpotifyClone.cancoes AS C ON UC.cancao_id = C.cancao_id
GROUP BY UC.cancao_id
HAVING reproducoes >= 2
ORDER BY cancao;
