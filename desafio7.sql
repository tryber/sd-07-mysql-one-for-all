CREATE VIEW SpotifyClone.perfil_artistas AS
SELECT a.nome AS artista, al.nome AS album, COUNT(*) AS seguidores FROM SpotifyClone.artistas AS a
INNER JOIN SpotifyClone.albuns AS al ON a.id = al.artista_id
INNER JOIN SpotifyClone.usuario_segue_artista AS usa ON a.id = usa.artista_id
GROUP BY artista, album ORDER BY seguidores DESC, artista, album;
-- explicação conforme plantão do instrutor Cristiano Cunha, onde o GROUP BY deve ser feito pelas colunas chamadas no SELECT, se fosse só por artista daria erro porque tem albuns diferentes para o mesmo artista e assim não tem como agrupar, enquanto que ao fazer o GROUP BY pelos 2 (artista e album) ele consegue trazer o resultado mesmo que tenha que repetir (caso do artista Walter)
