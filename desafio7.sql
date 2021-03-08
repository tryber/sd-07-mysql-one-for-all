CREATE VIEW SpotifyClone.perfil_artistas AS
SELECT a.nome AS artista, al.nome AS album, COUNT(al.id) AS seguidores FROM SpotifyClone.artistas AS a
INNER JOIN SpotifyClone.albuns AS al ON a.id = al.artista_id
INNER JOIN SpotifyClone.usuario_segue_artista AS usa ON a.id = usa.artista_id
GROUP BY al.id ORDER BY seguidores DESC, artista, album;
-- referência Rafael Guimarães:
-- https://github.com/tryber/sd-07-mysql-one-for-all/pull/59/commits/efeee41b1e32a75ff03ff494800b405f6c22b1bd
