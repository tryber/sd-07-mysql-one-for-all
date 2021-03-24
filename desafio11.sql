CREATE VIEW cancoes_premium AS
SELECT 
    SNG.song_name AS `nome`,
    COUNT(*) AS `reproducoes`
FROM historic HIS
    INNER JOIN songs SNG
    ON HIS.id_song = SNG.id_song
    INNER JOIN users USR
    ON HIS.id_user = USR.id_user
WHERE USR.id_plan > 1
GROUP BY HIS.id_song
ORDER BY `nome`;
