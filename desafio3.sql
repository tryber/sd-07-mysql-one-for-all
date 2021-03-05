CREATE VIEW historico_reproducao_usuarios AS

SELECT USU.nome_usuario,
CAN.nome_cancao
FROM SpotifyClone.usuarios USU
INNER JOIN historico HIS
ON USU.usuario_id = HIS.usuario_id
INNER JOIN cancoes CAN
ON HIS.cancao_id = CAN.cancao_id
ORDER BY USU.nome_usuario, CAN.nome_cancao;
