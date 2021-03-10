CREATE VIEW  historico_reproducao_usuarios AS
SELECT UserName AS 'usuario', SongName AS 'nome' 
FROM  histsongs AS H
INNER JOIN SpotifyClone.users AS U ON U.UserID = H.UserID
INNER JOIN SpotifyClone.songs AS S ON S.SongID = H.SongID
ORDER BY UserName, SongName;
