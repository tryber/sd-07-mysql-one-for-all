CREATE VIEW SpotifyClone.cancoes_premium AS 
SELECT mus.musica_nome AS "nome",
COUNT(*) AS "reproducoes"
FROM SpotifyClone.reproducoes AS rep
INNER JOIN SpotifyClone.musicas AS mus
ON mus.musica_id = rep.musica_id
INNER JOIN SpotifyClone.usuario AS usu
ON usu.usuario_id = rep.usuario_id
WHERE usu.plano_id <> 1
GROUP BY mus.musica_nome
ORDER BY 1;
