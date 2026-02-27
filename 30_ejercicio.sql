30. SELECT 
    CASE 
        WHEN edad BETWEEN 18 AND 29 THEN '18-29'
        WHEN edad BETWEEN 30 AND 39 THEN '30-39'
        WHEN edad BETWEEN 40 AND 49 THEN '40-49'
        WHEN edad BETWEEN 50 AND 59 THEN '50-59'
        WHEN edad BETWEEN 60 AND 69 THEN '60-69'
        ELSE '70+'
    END AS rango_edad,
    
    COUNT(DISTINCT c.id_cliente) AS clientes_unicos,
    COUNT(DISTINCT v.id_venta) AS numero_transacciones,
    COALESCE(SUM(v.total_venta), 0) AS ingresos_totales

FROM (
    SELECT 
        id_cliente,
        CAST(strftime('%Y', 'now') AS INTEGER) - 
        CAST(strftime('%Y', fecha_nacimiento) AS INTEGER) AS edad
    FROM CLIENTES
) c

LEFT JOIN VENTAS v ON c.id_cliente = v.id_cliente

GROUP BY rango_edad

ORDER BY 
    CASE rango_edad
        WHEN '18-29' THEN 1
        WHEN '30-39' THEN 2
        WHEN '40-49' THEN 3
        WHEN '50-59' THEN 4
        WHEN '60-69' THEN 5
        ELSE 6
    END;