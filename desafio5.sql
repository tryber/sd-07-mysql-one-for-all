CREATE VIEW top_2_hits_do_momento AS
SELECT A.cancao_title cancao, COUNT(B.usuario_id) reproducoes
FROM SpotifyClone.cancoes A, SpotifyClone.historico_de_reproducoes B
WHERE A.cancao_id=B.cancao_id
GROUP BY B.cancao_id
ORDER BY reproducoes DESC, cancao
LIMIT 2;
