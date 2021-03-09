USE SpotifyClone;

DROP VIEW IF EXISTS estatisticas_musicais;
CREATE VIEW estatisticas_musicais AS
    SELECT 
        (SELECT 
                COUNT(cancao.id)
            FROM
                SpotifyClone.Cancao AS cancao) AS 'cancoes',
        (SELECT 
                COUNT(artista.id)
            FROM
                SpotifyClone.Artista AS artista) AS 'artistas',
        (SELECT 
                COUNT(album.id)
            FROM
                SpotifyClone.Album AS album) AS 'albuns';
