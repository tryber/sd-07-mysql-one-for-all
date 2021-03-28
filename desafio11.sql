CREATE VIEW cancoes_premium AS
SELECT t3.song AS `nome`, COUNT(t2.reproductions) AS `reproducoes`
FROM users AS t1
INNER JOIN history_reproductions AS t2
ON t1.user_id = t2.user_id
INNER JOIN songs AS t3
ON t2.reproductions = t3.song
WHERE t1.plan = 'Familiar' OR t1.plan = 'Universitário'
GROUP BY `nome`
ORDER BY `nome`;
