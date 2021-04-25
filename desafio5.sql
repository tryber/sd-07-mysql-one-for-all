CREATE VIEW top_2_hits_do_momento AS
SELECT C.nome_cancao AS 'cancao',
COUNT(HR.id_usuario) AS 'reproducoes'
FROM SpotifyClone.cancoes AS C
INNER JOIN SpotifyClone.historico_reproducao AS HR ON HR.id_cancao = C.id_cancao
GROUP BY `cancao`
ORDER BY `reproducoes` DESC, `cancao`
LIMIT 2;
