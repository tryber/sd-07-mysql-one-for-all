CREATE VIEW perfil_artistas AS
SELECT dba.artista AS 'artista',
dbalb.album AS 'album',
COUNT(dbf.artista_id) AS 'seguidores'
FROM SpotifyClone.artists AS dba
INNER JOIN SpotifyClone.seguindo_artistas AS dbf
ON dbf.artista_id = dba.artista_id
INNER JOIN SpotifyClone.albums AS dbalb
ON dbalb.artista_id = dba.artista_id
GROUP BY dbalb.album_id
ORDER BY `seguidores` DESC, `artista` ASC;
