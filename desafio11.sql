CREATE VIEW cancoes_premium AS
SELECT
cancoes.cancao AS nome,
COUNT(*) AS reproducoes
FROM SpotifyClone.usuarios AS usuarios
INNER JOIN SpotifyClone.planos AS planos ON planos.id = usuarios.plano_id
INNER JOIN SpotifyClone.historicos AS historicos ON historicos.usuario_id = usuarios.id
INNER JOIN SpotifyClone.cancoes AS cancoes ON cancoes.id = historicos.cancao_id
WHERE planos.plano = 'familiar' OR planos.plano = 'universitário'
GROUP BY nome
ORDER BY nome;
