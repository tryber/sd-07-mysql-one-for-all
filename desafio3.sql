CREATE VIEW historico_reproducao_usuarios AS
SELECT table_usuarios.usuario_nome AS usuario,
  table_cancoes.cancoes_nome AS nome
FROM SpotifyClone.usuarios AS table_usuarios
  INNER JOIN SpotifyClone.historico AS table_historico ON table_usuarios.usuario_id = table_historico.usuario_id
  INNER JOIN SpotifyClone.cancoes AS table_cancoes ON table_historico.cancao_id = table_cancoes.cancao_id
ORDER BY usuario,
  nome;
