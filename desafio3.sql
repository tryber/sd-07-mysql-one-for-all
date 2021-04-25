CREATE VIEW historico_reproducao_usuarios AS 
SELECT usuario.first_name AS 'usuario', 
musica.song_title AS 'nome' 
FROM SpotifyClone.users AS usuario
INNER JOIN SpotifyClone.history_reproduction AS lista
ON lista.user_id = usuario.id
INNER JOIN SpotifyClone.song AS musica
ON lista.song_id = musica.id
ORDER BY usuario.first_name, musica.song_title;
