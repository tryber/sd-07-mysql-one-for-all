CREATE VIEW cancoes_premium AS
SELECT
(c.nome) AS nome,
COUNT(hr.cancao_id) AS reproducoes
FROM historico_reproducao hr
LEFT JOIN cancao c ON c.cancao_id = hr.cancao_id
LEFT JOIN usuario u ON u.usuario_id = hr.usuario_id
LEFT JOIN plano p ON p.plano_id = u.plano_id
WHERE p.nome = 'familiar' OR p.nome = 'universitário'
GROUP BY c.nome
ORDER BY nome;
