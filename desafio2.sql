-- Crie uma VIEW chamada estatisticas_musicais que exiba três colunas:
-- CREATE VIEW estatisticas_musicais AS
-- A primeira coluna deve exibir a [quantidade total de canções]. Dê a essa coluna o alias "cancoes".
-- COUNT(musical_track.id) AS "cancoes"
-- A segunda coluna deve exibir a quantidade total de artistas e deverá ter o alias "artistas".
-- COUNT(albuns.artist_id) AS "artistas"
-- A terceira coluna deve exibir a quantidade de álbuns e deverá ter o alias "albuns".
-- COUNT(albuns.id) AS "albuns"
-- Sua VIEW deve retornar a seguinte informação ao ser consultada:
-- Estatísticas musicais
-- cancoes   artistas  albuns
-- 18        4         5
CREATE VIEW estatisticas_musicais AS
SELECT
  (SELECT COUNT(musical_track.id) FROM musical_track) as 'cancoes',
  (SELECT COUNT(singers.id) FROM singers) as "artistas",
  (SELECT COUNT(albuns.id) FROM albuns) as "albuns";
