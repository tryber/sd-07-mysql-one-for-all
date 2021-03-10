CREATE VIEW estatisticas_musicais AS
SELECT    
    (SELECT COUNT(*) AS "cancoes" FROM SpotifyClone.songs),
    (SELECT COUNT(*) AS "artistas" FROM SpotifyClone.artists),
    (SELECT COUNT(*) AS "albuns" FROM SpotifyClone.albums);
