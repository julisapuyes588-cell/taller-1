SELECT c.nombre, (strftime('%Y', 'NOW') - strftime ('%Y', c.fecha_nacimiento)) AS edad, '$' || SUM(V.total_venta) AS total_gastado
FROM clientes c
JOIN ventas v ON c.id_cliente= V.id_cliente  GROUP BY c.id_cliente, c.nombre, c,fecha_nacimiento HAVING edad > 60  ORDER BY edad DESC;