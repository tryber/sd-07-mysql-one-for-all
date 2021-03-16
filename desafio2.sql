use SpotifyClone;

DROP VIEW IF EXISTS estatisticas_musicais;

CREATE VIEW estatisticas_musicais as
select count(*) as 'cancoes',
(
select count(*) from artists
) as 'artistas',
(
select count(*) from albums
) as 'albuns'
from songs;
