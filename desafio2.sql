CREATE VIEW estatisticas_musicais AS
    SELECT 
        COUNT(DISTINCT (m.musica_id)) AS 'cancoes',
        COUNT(DISTINCT (a.artista_id)) AS 'artistas',
        COUNT(DISTINCT (a2.album_id)) AS 'albuns'
    FROM
        SpotifyClone.musicas AS m
            INNER JOIN
        SpotifyClone.albuns AS a2 ON m.album_id = a2.album_id
            INNER JOIN
        SpotifyClone.artistas AS a ON a2.artista_id = a.artista_id;
        