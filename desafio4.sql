-- Desafio 4
-- Crie uma VIEW com o nome top_3_artistas que deve mostrar somente as três pessoas artistas
-- mais populares no banco SpotifyClone, possuindo as seguintes colunas:
-- A primeira coluna deve possuir o alias "artista" e exibir o nome da pessoa artista.
-- A segunda coluna deve ter o alias "seguidores" e exibir a quantidade de pessoas que estão seguindo aquela pessoa artista.
-- Seu resultado deve estar ordenado em ordem decrescente, baseando-se na quantidade de seguidores. 
-- Em caso de empate, ordene os resultados pelo nome da pessoa artista em ordem alfabética.

CREATE VIEW SpotifyClone.top_3_artistas AS
SELECT 
A.nome AS "artista",
Count(A.nome) AS "seguidores"
FROM seguidores as S
INNER JOIN artistas as A ON A.id = S.id_artista
GROUP BY 
A.nome
ORDER BY
2 DESC,
1
LIMIT 3;
