CREATE VIEW top_2_hits_do_momento AS
SELECT
M.name_song AS 'cancao',
COUNT(musicas_idmusicas) AS `reproducoes`
FROM SpotifyClone.usuario_musicas
JOIN musicas M ON M.idmusicas = musicas_idmusicas
GROUP BY musicas_idmusicas
ORDER BY `reproducoes` DESC, M.name_song
LIMIT 2;
