SELECT productos.categoria, SUM(detalle_ventas.cantidad * detalle_ventas.precio_unitario) AS ingreso_total, SUM(detalle_ventas.cantidad) AS total_unidades
FROM detalle_ventas
INNER JOIN productos ON productos.id_producto = detalle_ventas.id_producto
GROUP BY productos.categoria;