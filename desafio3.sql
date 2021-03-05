CREATE VIEW historico_reproducao_usuarios AS
SELECT u.usuario AS 'usuario', m.musica AS 'nome' FROM SpotifyClone.historico h
INNER JOIN SpotifyClone.usuarios u ON h.usuario_id = u.usuario_id
INNER JOIN SpotifyClone.musicas m ON h.musicas_id = m.musicas_id
ORDER BY u.usuario ASC, m.musica ASC;
