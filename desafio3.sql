CREATE VIEW historico_reproducao_usuarios AS(
SELECT u.nome_usuario AS `usuario`,
h.nome_reproducao AS `nome`
FROM usuario AS `u`
INNER JOIN usuario_historico AS `uh` 
ON u.usuario_id = uh.usuario_id
INNER JOIN historico AS `h`
ON uh.historico_id = h.historico_id
ORDER BY `usuario`, `nome`
);
