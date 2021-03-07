CREATE VIEW SpotifyClone.cancoes_premium AS
SELECT m.musica_nome AS `nome`,
    COUNT(*) AS `reproducoes`
FROM SpotifyClone.historico AS h
    JOIN SpotifyClone.musica AS m ON m.musica_id = h.musica_id
    JOIN SpotifyClone.usuario AS u ON u.usuario_id = h.usuario_id
WHERE u.plano_id <> 1
GROUP BY m.musica_id
ORDER BY `nome`;
