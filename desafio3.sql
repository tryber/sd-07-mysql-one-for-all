CREATE VIEW historico_reproducao_usuarios AS
SELECT A.nome usuario, B.cancao_title nome
FROM SpotifyClone.usuarios A, SpotifyClone.cancoes B, SpotifyClone.historico_de_reproducoes C
WHERE C.usuario_id=A.usuario_id AND C.cancao_id=B.cancao_id
ORDER BY usuario, nome;
