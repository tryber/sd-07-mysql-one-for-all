CREATE VIEW historico_reproducao_usuarios AS
  SELECT usuario.nome_usuario AS usuario, cancoes.nome_cancoes AS nome
  FROM SpotifyClone.usuario AS usuario
    INNER JOIN SpotifyClone.historico_reproducoes AS historico
      ON usuario.usuario_id = historico.usuario_id
    INNER JOIN SpotifyClone.cancoes AS cancoes
      ON cancoes.cancao_id = historico.cancao_id;
