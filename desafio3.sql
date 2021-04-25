CREATE VIEW historico_reproducao_usuarios AS
SELECT u.nome AS usuario, c.nome 
FROM usuarios AS u
INNER JOIN historico_reproducoes AS h
ON u.id = h.usuario_id
INNER JOIN cancoes AS c
ON c.id = h.cancao_id
ORDER BY usuario, nome;
