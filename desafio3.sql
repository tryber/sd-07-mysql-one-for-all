CREATE VIEW historico_reproducao_usuarios AS
SELECT U.nome AS usuario,
C.titulo_cancao AS nome
FROM SpotifyClone.usuarios AS U
INNER JOIN SpotifyClone.historico_de_reproducoes AS H
ON U.usuario_id = H.usuario_id
INNER JOIN SpotifyClone.cancoes AS C
ON C.cancao_id = H.cancao_id
ORDER BY 1, 2;
