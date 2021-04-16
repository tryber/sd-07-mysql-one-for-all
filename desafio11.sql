CREATE VIEW cancoes_premium AS
  SELECT
    c.cancao AS nome,
    COUNT(*) AS reproducoes
  FROM SpotifyClone.usuarios u
  INNER JOIN SpotifyClone.planos p ON p.id = u.plano_id
  INNER JOIN SpotifyClone.historico h ON h.usuario_id = u.id
  INNER JOIN SpotifyClone.cancoes c ON c.id = h.cancao_id
  WHERE p.plano = 'familiar' OR p.plano = 'universitário'
  GROUP BY nome
  ORDER BY nome;
