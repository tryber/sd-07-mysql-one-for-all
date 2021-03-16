use SpotifyClone;
CREATE VIEW estatisticas_musicais as
select (count(*)) as 'cancoes',
(
select count(*) from artists
) as 'artistas',
(
select count(*) from albums
) as 'albuns'
from songs; 