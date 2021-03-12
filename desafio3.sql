CREATE VIEW SpotifyClone.historico_reproducao_usuarios AS
SELECT u.nome AS usuario, c.nome AS nome FROM SpotifyClone.users AS u
INNER JOIN SpotifyClone.history AS h ON u.id = h.usuario_id
INNER JOIN SpotifyClone.songs AS s ON h.id = s.cancao_id
ORDER BY u.nome, s.nome;
