CREATE VIEW top_3_artistas AS
    SELECT 
        seguindo_artistas artista, COUNT(*) seguidores
    FROM
        seguindo
    GROUP BY seguindo_artistas
    ORDER BY COUNT(*) DESC , seguindo_artistas
    LIMIT 3;
