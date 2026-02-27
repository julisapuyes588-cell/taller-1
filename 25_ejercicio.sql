SELECT c.nombre AS cliente, COUNT (DISTINCT dv.id_producto) AS variedad_productos
FROM ventas v
JOIN clientes c ON v.id_cliente = c.id_cliente
JOIN detalle _ventas dv ON v.id_venta = dv.id_venta
GROUP BY v.id_cliente, c.nombre
ORDER BY variedad_productos DESC
LIMIT 1;