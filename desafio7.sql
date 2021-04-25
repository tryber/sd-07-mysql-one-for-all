-- Refrência do GROUP BY: https://github.com/tryber/sd-07-mysql-one-for-all/blob/ANDREHORMAN-MySQL-One-For-All/desafio7.sql
CREATE VIEW perfil_artistas AS
SELECT
SINGERS.name AS artista,
ALBUNS.title AS album,
COUNT(FOLLOW.user_following_id) AS seguidores

FROM SpotifyClone.singers AS SINGERS
INNER JOIN SpotifyClone.albuns ALBUNS ON ALBUNS.singer_id = SINGERS.singer_id
INNER JOIN SpotifyClone.users_following FOLLOW ON FOLLOW.singer_following_id = SINGERS.singer_id
GROUP BY album, artista
ORDER BY seguidores DESC, artista, album;
