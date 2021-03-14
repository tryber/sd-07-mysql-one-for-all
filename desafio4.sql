-- Referência do GROUP BY: https://github.com/tryber/sd-07-mysql-one-for-all/blob/arthur-massaini-project-mysql-one-for-all/desafio4.sql
CREATE VIEW top_3_artistas AS
SELECT
SINGERS.name AS artista,
COUNT(FOLLOW.user_following_id) AS seguidores

FROM SpotifyClone.singers AS SINGERS
INNER JOIN SpotifyClone.users_following FOLLOW ON SINGERS.singer_id = FOLLOW.singer_following_id
GROUP BY FOLLOW.singer_following_id
ORDER BY seguidores DESC, artista ASC
LIMIT 3;
