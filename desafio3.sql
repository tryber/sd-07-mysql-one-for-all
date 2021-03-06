-- Desafio 3
-- Crie uma VIEW chamada historico_reproducao_usuarios. Essa VIEW deverá ter
-- apenas duas colunas:
-- A primeira coluna deve possuir o alias "usuario" e exibir o nome da
-- pessoa usuária.
-- A segunda coluna deve possuir o alias "nome" e exibir o nome da canção
-- ouvida pela pessoa com base no seu histórico de reprodução.
-- Os resultados devem estar ordenados por nome da pessoa usuária em ordem 
-- alfabética e em caso de empate no nome os resultados devem ser ordenados pelo 
-- nome da canção em ordem alfabética.

CREATE VIEW SpotifyClone.historico_reproducao_usuarios AS
SELECT 
U.nome as "usuario", 
C.nome as "nome"
FROM reproducoes as R 
INNER JOIN usuarios as U ON R.id_usuario = U.id
INNER JOIN cancoes as C ON C.id = R.id_cancao
ORDER BY
1,
2;
