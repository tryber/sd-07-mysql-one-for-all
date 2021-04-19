CREATE VIEW estatisticas_musicais AS
    SELECT 
        COUNT(cancao_id) cancoes,
        (SELECT 
                COUNT(artista_id)
            FROM
                SpotifyClone.artista) artistas,
        (SELECT 
                COUNT(album_id)
            FROM
                SpotifyClone.album) albuns
    FROM
        SpotifyClone.cancao;
