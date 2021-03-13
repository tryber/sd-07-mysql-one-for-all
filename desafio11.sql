CREATE VIEW cancoes_premium AS
SELECT ca.cancao AS "nome",
COUNT(us.usuario_id) AS "reproducoes"
FROM SpotifyClone.cancoes AS ca
INNER JOIN SpotifyClone.historicos AS hi
ON ca.cancao_id = hi.cancao_id
INNER JOIN SpotifyClone.users AS us
ON hi.usuario_id = us.usuario_id
INNER JOIN SpotifyClone.planos AS pl
ON us.plano_id = pl.plano_id
WHERE pl.plano_name IN ('familiar','universitário')
GROUP BY 1
ORDER BY 1;
