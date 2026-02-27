26. SELECT c.nombre,
       SUM(v.total_venta) AS total_gastado
FROM CLIENTES c
JOIN VENTAS v ON c.id_cliente = v.id_cliente
JOIN DETALLE_VENTAS dv ON v.id_venta = dv.id_venta
JOIN PRODUCTOS p ON dv.id_producto = p.id_producto
GROUP BY c.id_cliente, c.nombre
HAVING 
    SUM(CASE WHEN p.categoria = 'Paracaídas' THEN 1 ELSE 0 END) > 0
    AND
    SUM(CASE WHEN p.categoria = 'Accesorios' THEN 1 ELSE 0 END) = 0;