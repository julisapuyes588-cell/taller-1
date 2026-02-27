SELECT cl.nombre, COUNT(vt.id_venta) AS veces_usado
FROM ventas vt
INNER JOIN clientes cl ON cl.id_cliente = vt.id_cliente
WHERE vt.cupon_usado = 'ULTIMO_SUSPIRO'
GROUP BY cl.nombre
HAVING veces_usado >= 3;