CREATE VIEW cancoes_premium AS
SELECT
can.cancao AS nome,
COUNT(*) AS reproducoes
FROM SpotifyClone.cancoes AS can
JOIN historicos AS hist
ON hist.cancao_id = can.cancao_id
JOIN usuarios AS usr
ON usr.usuario_id = hist.usuario_id
JOIN planos AS plano
ON plano.plano_id = usr.usuario_id
WHERE plano.plano IN ('universitario', 'familiar')
GROUP BY nome
ORDER BY nome;
