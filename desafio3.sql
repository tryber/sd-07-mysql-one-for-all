CREATE VIEW historico_reproducao_usuarios AS
SELECT
u.nome AS usuario,
c.nome AS nome
FROM spotifyclone.historico_reproducao hr
INNER JOIN spotifyclone.usuario u ON u.id = hr.usuario_id
INNER JOIN spotifyclone.cancao c ON c.id = hr.cancao_id
ORDER BY usuario, nome;
