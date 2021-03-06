CREATE VIEW cancoes_premium AS
  SELECT S.song_name AS nome, COUNT(*) AS reproducoes
  FROM SpotifyClone.Songs AS S
  INNER JOIN (
  SELECT MH.user_id, MH.song_id, Plano.tipo
  FROM SpotifyClone.Music_history AS MH
  INNER JOIN SpotifyClone.Users AS U
  ON MH.user_id = U.user_id
  INNER JOIN SpotifyClone.Plano AS Plano
  ON U.plano_id = Plano.plano_id
  WHERE tipo <> 'gratuito') AS C
  ON S.song_id = C.song_id
  GROUP BY nome
  ORDER BY nome;
