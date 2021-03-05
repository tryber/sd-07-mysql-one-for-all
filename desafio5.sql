CREATE VIEW top_2_hits_do_momento AS
SELECT
S.song_name AS cancao,
count(*) AS reproducoes
FROM
User_Song AS US
JOIN Song as S ON US.song_ID = S.song_ID
GROUP BY
cancao
ORDER BY
reproducoes DESC,
cancao
LIMIT
2;
