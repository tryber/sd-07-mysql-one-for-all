CREATE VIEW top_2_hits_do_momento AS
SELECT M.nome_musica AS `cancao`, COUNT(H.usuario_id) AS `reproducoes`
FROM SpotifyClone.historico AS H
INNER JOIN SpotifyClone.musicas M ON M.id_musica = H.id_musica
GROUP BY `cancao`
ORDER BY `reproducoes` DESC, `cancao` 
LIMIT 2;
