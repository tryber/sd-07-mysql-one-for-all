CREATE VIEW historico_reproducao_usuarios AS SELECT
U.usuario_nome AS usuario, 
C.cancao_nome AS nome
FROM Usuarios AS U
INNER JOIN Historico_Usuarios AS H
ON U.usuario_id = H.fk_usuario_id
INNER JOIN Cancoes AS C
ON C.cancao_id = H.fk_cancao_id
ORDER BY usuario, nome;
