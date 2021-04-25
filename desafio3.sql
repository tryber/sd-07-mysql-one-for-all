CREATE VIEW historico_reproducao_usuarios AS
SELECT u.usuario, m.musica AS nome FROM SpotifyClone.usuarios AS u
INNER JOIN SpotifyClone.historicos AS h ON h.usuario_id = u.usuario_id
INNER JOIN SpotifyClone.musicas AS m ON h.musica_id = m.musica_id
ORDER BY u.usuario, m.musica;
