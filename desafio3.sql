CREATE VIEW historico_reproducao_usuarios AS
SELECT
u.nome AS usuario,
c.nome AS nome
FROM historico_reproducao hr
INNER JOIN usuario u ON u.usuario_id = hr.usuario_id
INNER JOIN cancao c ON c.cancao_id = hr.cancao_id
ORDER BY usuario, nome;
