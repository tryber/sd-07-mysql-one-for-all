CREATE VIEW historico_reproducao_usuarios AS
SELECT 
    USR.username AS `usuario`,
    SNG.song_name AS `nome`
FROM historic HIS
    INNER JOIN users USR
      ON HIS.id_user = USR.id_user
    INNER JOIN songs SNG
      ON HIS.id_song = SNG.id_song
ORDER BY `usuario`, `nome`;
