CREATE VIEW cancoes_premium AS
SELECT M.nome AS nome, COUNT(H.musica_id) AS reproducoes
FROM SpotifyClone.historico H
INNER JOIN SpotifyClone.usuarios U
ON H.usuario_id = U.usuario_id
INNER JOIN SpotifyClone.planos P
ON U.plano_id = P.plano_id
INNER JOIN SpotifyClone.musicas M
ON H.musica_id = M.musica_id
WHERE P.plano in ('familiar', 'universitário')
GROUP BY 1
ORDER BY M.nome;
