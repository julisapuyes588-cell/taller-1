SELECT productos.nombre, SUM(detalle_ventas.cantidad) AS total_unidades_vendidas
FROM detalle_ventas
INNER JOIN productos ON productos.id_producto = detalle_ventas.id_producto
GROUP BY productos.nombre
ORDER BY total_unidades_vendidas DESC
LIMIT 1;