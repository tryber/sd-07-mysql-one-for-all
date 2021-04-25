CREATE VIEW cancoes_premium AS
SELECT
S.song_name AS nome,
COUNT(*) AS reproducoes
FROM
User_Song AS US
JOIN Song AS S ON US.song_ID = S.song_ID
JOIN User AS U ON US.user_ID = U.user_ID
JOIN Subscription AS SU ON U.subscription_ID = SU.subscription_ID
WHERE
SU.subscription_name IN ('universitário', 'familiar')
GROUP BY
nome
ORDER BY
nome;
