CREATE VIEW top_2_hits_do_momento AS
SELECT M.nome AS cancao, COUNT(H.musica_id) AS reproducoes FROM SpotifyClone.historico H
INNER JOIN SpotifyClone.musicas M
ON H.musica_id = M.musica_id
GROUP BY M.nome
ORDER BY 2 DESC, 1 LIMIT 2;
