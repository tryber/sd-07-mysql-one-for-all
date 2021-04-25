CREATE VIEW cancoes_premium AS
SELECT t2.musica AS 'nome',
COUNT(t1.musica_id) AS 'reproducoes'
FROM SpotifyClone.historico_reproducao AS t1
INNER JOIN SpotifyClone.musicas AS t2
ON t1.musica_id = t2.musica_id
INNER JOIN SpotifyClone.usuarios AS t3
ON t1.usuario_id = t3.usuario_id
WHERE t3.plano_id = 2 OR t3.plano_id = 3
GROUP BY t2.musica
ORDER BY 1 ASC;
