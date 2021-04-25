CREATE VIEW historico_reproducao_usuarios AS
SELECT t1.usuario AS 'usuario',
t3.musica AS 'nome'
FROM SpotifyClone.usuarios AS t1
INNER JOIN SpotifyClone.historico_reproducao AS t2
ON t1.usuario_id = t2.usuario_id
INNER JOIN SpotifyClone.musicas AS t3
ON t2.musica_id = t3.musica_id
ORDER BY 1, 2;
