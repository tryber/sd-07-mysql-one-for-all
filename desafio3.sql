CREATE VIEW historico_reproducao_usuarios AS
SELECT
U.name_user AS 'usuario',
MU.name_song AS 'nome'
FROM usuario_musicas M
JOIN usuario U ON U.idusuario = M.usuario_idusuario
JOIN musicas MU ON MU.idmusicas = musicas_idmusicas
ORDER BY U.name_user, MU.name_song;
