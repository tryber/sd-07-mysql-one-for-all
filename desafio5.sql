CREATE VIEW top_2_hits_do_momento AS
  SELECT cancoes.nome_cancoes AS cancao, COUNT(reproducoes.usuario_id) AS reproducoes
  FROM SpotifyClone.cancoes AS cancoes
    INNER JOIN SpotifyClone.historico_reproducoes AS reproducoes
      ON cancoes.cancao_id = reproducoes.cancao_id
    GROUP BY cancao
    ORDER BY reproducoes DESC, cancao ASC LIMIT 2;
