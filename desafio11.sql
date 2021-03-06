-- Desafio 11
-- Crie uma VIEW chamada cancoes_premium que exiba o nome e a quantidade de vezes que cada 
-- canção foi tocada por pessoas usuárias do plano familiar ou universitário, de acordo com os detalhes a seguir:
-- A primeira coluna deve exibir o nome da canção, com o alias "nome";
-- A segunda coluna deve exibir a quantidade de pessoas que já escutaram aquela canção, com o alias "reproducoes";
-- Seus resultados devem estar agrupados pelo nome da canção e ordenados em ordem alfabética.

CREATE VIEW SpotifyClone.cancoes_premium AS
SELECT 
C.nome as "nome",
COUNT(R.id_cancao) AS "reproducoes"
FROM reproducoes AS R
INNER JOIN cancoes AS C ON C.id = R.id_cancao
WHERE
EXISTS (
SELECT 1
FROM usuarios as U
WHERE 
U.id_plano in (2, 3) AND
U.ID = R.id_usuario
)
GROUP BY
C.nome,
R.id_cancao
ORDER BY
1;
