-- Crie uma VIEW chamada estatisticas_musicais que exiba três colunas:
-- A primeira coluna deve exibir a quantidade total de canções. Dê a essa coluna o alias "cancoes".
-- A segunda coluna deve exibir a quantidade total de artistas e deverá ter o alias "artistas".
-- A terceira coluna deve exibir a quantidade de álbuns e deverá ter o alias "albuns".

CREATE VIEW SpotifyClone.estatisticas_musicais AS
SELECT 
(SELECT COUNT(*) FROM cancoes) as "cancoes",
(SELECT COUNT(*) FROM artistas) as "artistas",
(SELECT COUNT(*) FROM albuns) as "albuns"
FROM DUAL;
