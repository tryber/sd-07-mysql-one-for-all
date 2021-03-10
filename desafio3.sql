CREATE VIEW historico_reproducao_usuarios AS 
SELECT t1.name AS `usuario`, t2.reproductions AS `nome`
FROM users AS t1
INNER JOIN history_reproductions AS t2
WHERE t1.user_id = t2.user_id
ORDER BY `usuario`, `nome`;
