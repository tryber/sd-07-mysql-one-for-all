CREATE VIEW historico_reproducao_usuarios AS
SELECT Us.user_colum AS usuario, 
So.song_colum AS nome FROM users AS Us
INNER JOIN history AS Hs ON Us.user_id = Hs.user_id
INNER JOIN songs AS So ON So.song_id = Hs.song_id
ORDER BY `usuario`,`nome` ASC;