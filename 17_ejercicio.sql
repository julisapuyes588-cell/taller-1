SELECT 
SUM (total_venta / 0.70) AS total_sin_descuento
SUM (total_venta) AS total_con_descuento,
SUM (total_venta/0.70 - total_venta) AS dinero_perdido
FROM ventas WHERE cupon_usado = 'ULTIMO_SUSPIRO';