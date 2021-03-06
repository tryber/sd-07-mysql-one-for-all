CREATE VIEW cancoes_premium AS
SELECT A.cancao_title nome, COUNT(*) reporducoes
FROM SpotifyClone.cancoes A, SpotifyClone.historico_de_reproducoes B, SpotifyClone.usuarios C
WHERE A.cancao_id=B.cancao_id AND B.usuario_id=C.usuario_id AND C.plano_id IN (2, 3)
GROUP BY B.cancao_id
ORDER BY nome;
