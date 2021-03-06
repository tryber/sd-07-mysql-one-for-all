SELECT * FROM SpotifyClone.artistas;
SELECT * FROM SpotifyClone.album;
SELECT * FROM SpotifyClone.seguindo;

SELECT (ALB.nome_album) album,
ART.nome_artista artista,
SEG.artista_id
FROM SpotifyClone.artistas ART
INNER JOIN SpotifyClone.album ALB
ON ART.artista_id = ALB.artista_id
INNER JOIN SpotifyClone.seguindo SEG
ON ART.artista_id = SEG.artista_id;

