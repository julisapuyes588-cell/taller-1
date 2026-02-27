SELECT clientes.nombre,
       SUM(ventas.total_venta) AS total_gastado,
       CASE
           WHEN SUM(ventas.total_venta) > 5000 THEN 'Alto Valor'
           WHEN SUM(ventas.total_venta) BETWEEN 2000 AND 5000 THEN 'Medio Valor'
           ELSE 'Bajo Valor'
       END AS clasificacion
FROM ventas
INNER JOIN clientes ON clientes.id_cliente = ventas.id_cliente
GROUP BY clientes.nombre;