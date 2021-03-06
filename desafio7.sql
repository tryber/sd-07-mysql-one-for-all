-- Desafio 7
-- Mostre uma relação de todos os álbuns produzidos por cada pessoa artista, com a quantidade de seguidores que 
-- ela possui, de acordo com os detalhes a seguir. Para tal, crie uma VIEW chamada perfil_artistas, com as seguintes colunas:
-- A primeira coluna deve exibir o nome da pessoa artista, com o alias "artista".
-- A segunda coluna deve exibir o nome do álbum, com o alias "album".
-- A terceira coluna deve exibir a quantidade de pessoas seguidoras que aquela pessoa artista possui e deve possuir o alias "seguidores".
-- Seus resultados devem estar ordenados de forma decrescente, baseando-se no número de pessoas seguidoras. 
-- Em caso de empate no número de pessoas, ordene os resultados pelo nome da pessoa artista em ordem alfabética e caso há artistas 
-- com o mesmo nome, ordene os resultados pelo nome do álbum alfabeticamente.

CREATE VIEW SpotifyClone.perfil_artistas AS
SELECT 
A.nome AS "artista", 
AB.nome AS "album",
COUNT(AB.nome) AS "seguidores"
FROM seguidores AS S
INNER JOIN artistas AS A ON A.id = S.id_artista
INNER JOIN albuns AS AB ON AB.id_artista = A.id
GROUP BY 
A.nome,
AB.nome
ORDER BY
3 DESC,
1,
2;
