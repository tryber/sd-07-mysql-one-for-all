CREATE VIEW historico_reproducao_usuarios AS
SELECT
  USUARIOS.usuario,
  MUSICAS.musica AS "nome"
FROM SpotifyClone.historico_de_reproducoes AS HISTORICO
INNER JOIN SpotifyClone.usuarios AS USUARIOS
ON USUARIOS.usuario_id = HISTORICO.usuario_id
INNER JOIN SpotifyClone.musicas AS MUSICAS
ON MUSICAS.musica_id = HISTORICO.musica_id
ORDER BY 1, 2;
