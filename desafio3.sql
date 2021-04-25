CREATE VIEW historico_reproducao_usuarios AS
SELECT u.nome AS "usuario",
c.nome AS "nome"
FROM SpotifyClone.tabela_historico_reproducao hr
INNER JOIN SpotifyClone.tabela_usuario u
ON hr.id_usuario = u.id_usuario
INNER JOIN SpotifyClone.tabela_cancoes c
ON hr.id_cancao = c.id_cancao
ORDER BY `usuario`,`nome`;
