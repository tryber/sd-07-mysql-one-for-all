CREATE VIEW cancoes_premium AS
SELECT
s.nome_musica AS nome,
COUNT(r.musica_id) AS reproducoes
FROM
SpotifyClone.reproductions AS r
INNER JOIN
SpotifyClone.songs AS s
ON
s.musica_id = r.musica_id
INNER JOIN
SpotifyClone.users AS u
ON
r.usuario_id = u.usuario_id
WHERE u.plano_id <> 1
GROUP BY 1
ORDER BY 1;
