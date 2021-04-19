CREATE VIEW cancoes_premium AS
SELECT M.musica AS nome, COUNT(H.musica_id) AS reproducoes
FROM SpotifyClone.historico AS H
INNER JOIN SpotifyClone.usuarios AS U
ON H.usuario_id = U.usuario_id
INNER JOIN SpotifyClone.planos AS P
ON U.plano_id = P.plano_id
INNER JOIN SpotifyClone.musicas AS M
ON H.musica_id = M.musica_id
WHERE P.plano_nome in ('familiar', 'universitário')
GROUP BY 1
ORDER BY M.musica;
