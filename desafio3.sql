CREATE VIEW SpotifyClone.historico_reproducao_usuarios AS 
SELECT usu.usuario_nome AS "usuario",
mus.musica_nome AS "nome"
FROM SpotifyClone.usuario AS usu
INNER JOIN  SpotifyClone.reproducoes AS rep
ON rep.usuario_id = usu.usuario_id
INNER JOIN  SpotifyClone.musicas AS mus
ON mus.musica_id = rep.musica_id
ORDER BY 1, 2;
