CREATE VIEW top_2_hits_do_momento AS
    SELECT 
        historico_de_reproducoes AS cancao, COUNT(*) AS reproducoes
    FROM
        historico_reproducao
    GROUP BY historico_de_reproducoes
    ORDER BY COUNT(*) DESC , historico_de_reproducoes
    LIMIT 2;
