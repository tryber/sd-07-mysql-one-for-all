CREATE VIEW  perfil_artistas AS
SELECT
(SELECT nome FROM SpotifyClone.artistas WHERE artista_id = alb.artista_id) "artista",
alb.album "album",
(SELECT COUNT(*) FROM SpotifyClone.usuario_artista WHERE seguindo_artista = alb.artista_id ) "seguidores"
FROM albuns AS alb
ORDER BY `seguidores` DESC, `artista`, `album`;