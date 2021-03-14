CREATE VIEW faturamento_atual AS
	SELECT
		    MIN(t1.valor) AS 'faturamento_minimo',
        MAX(t1.valor) AS 'faturamento_maximo',
        ROUND(AVG(t1.valor), 2) AS 'faturamento_medio',
        SUM(t1.valor) AS 'faturamento_total'
    FROM
        SpotifyClone.planos AS t1
	INNER JOIN
        SpotifyClone.usuarios AS t2 ON t1.plano_id = t2.plano_id;
