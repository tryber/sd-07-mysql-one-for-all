USE SpotifyClone;

DROP VIEW IF EXISTS estatisticas_musicais;
CREATE VIEW estatisticas_musicais AS
    SELECT 
        (SELECT 
                COUNT(cancao.id)
            FROM
                SpotifyClone.cancao AS cancao) AS 'cancoes',
        (SELECT 
                COUNT(artista.id)
            FROM
                SpotifyClone.artista AS artista) AS 'artistas',
        (SELECT 
                COUNT(album.id)
            FROM
                SpotifyClone.album AS album) AS 'albuns';
