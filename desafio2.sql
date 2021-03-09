CREATE VIEW estatisticas_musicais AS
    SELECT 
        COUNT(cancao_id) cancoes,
        (SELECT 
                COUNT(artista_id)
            FROM
                spotifyclone.artista) artistas,
        (SELECT 
                COUNT(album_id)
            FROM
                spotifyclone.album) albuns
    FROM
        spotifyclone.cancao;
