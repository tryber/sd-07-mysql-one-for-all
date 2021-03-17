CREATE VIEW cancoes_premium AS
SELECT
s.song_title as nome,
count(p.user_id) as reproducoes
FROM SpotifyClone.plays p
inner join SpotifyClone.songs s ON s.song_id = p.song_id
where p.user_id in (select user_id from users where subscription_id in (2,3))
GROUP BY 1
ORDER BY
1 ASC;
