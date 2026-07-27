/*consulta1_Resumen ejecutivo mensual */
SELECT
    MONTH(fecha_venta) AS mes,
    SUM(cantidad * precio_unitario) AS Total_facturado,
    COUNT(id_venta) AS cantidad_pedidos,
    AVG(cantidad * precio_unitario) AS ticket_promedio
FROM ventas
GROUP BY MONTH(fecha_venta)
ORDER BY MONTH(fecha_venta);

/*Consulta2_ Ranking de productos*/
SELECT TOP 5
id_producto, 
SUM (cantidad) AS cantidad_ventida, 
SUM (precio_unitario* cantidad)AS total_facturado
FROM ventas
GROUP BY id_producto
ORDER BY (total_facturado) DESC
;

/*Consulta3_Clientes recurrentes*/
SELECT 
id_cliente,
COUNT (id_venta) as cant_pedidos,
SUM (cantidad *precio_unitario) AS total_facturado
FROM ventas
GROUP BY id_cliente
HAVING COUNT (*) > 1;

/*Consulta4_Meses por encima/por debajo del promedio*/
SELECT
    MONTH(fecha_venta) AS mes,
    SUM(cantidad * precio_unitario) AS total_facturado,
    CASE 
        WHEN SUM(cantidad * precio_unitario) > (
            SELECT AVG(total) FROM (
                SELECT SUM(cantidad * precio_unitario) AS total
                FROM ventas
                GROUP BY MONTH(fecha_venta)
            ) AS totales_mensuales
        ) THEN 'Por encima'
        ELSE 'Por debajo'
    END AS comparacion_promedio
FROM ventas
GROUP BY MONTH(fecha_venta);

-- en el mes de marzo hubieron 10 pedidos--
--el producto con mayor facturacion es el id_producto 1--
-- cada cliente realizo dos pedidos--
