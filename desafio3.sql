CREATE VIEW historico_reproducao_usuario AS
SELECT U.nome_usuario AS 'usuario',
C.nome_cancao AS 'nome'
FROM SpotifyClone.usuarios AS U
INNER JOIN SpotifyClone.historico_reproducao AS HR ON HR.id_usuario = U.id_usuario
INNER JOIN SpotifyClone.cancoes AS C ON C.id_cancao = HR.id_cancao
ORDER BY `usuario`, `nome`;
