#2. 
SELECT * FROM
clientes,empleados,inventario,productos,proveedor,
proveedor_has_productos,ventas,ventas_has_clientes,
ventas_has_clientes_has_productos;

INSERT INTO clientes 
values(27,"Diego Aaron","Portillo", "Hernandez","Av.11a", "1103","Chihuahua");

INSERT INTO empleados
values(27,"Diego Aaron","Portillo", "Hernandez","Av.11a", "1103","Chihuahua");

INSERT INTO productos
values(27,"Figura de El peje",9853,8742);

INSERT INTO inventario
values(27,1,1,30);

INSERT INTO proveedor
values(27,27,8742);

INSERT INTO proveedor_has_productos
values(27,27);

INSERT INTO ventas
values(900,'2018-05-23',27,100,27);


#3.
SELECT * FROM
clientes,empleados,inventario,productos,proveedor,
proveedor_has_productos,ventas,ventas_has_clientes,
ventas_has_clientes_has_productos;

#4.
 SELECT e.no_emepleado,e.nombre_e,e.apellido_p,e.apellido_m,p.clave_producto,p.descripcion,p.precio_unitario
FROM empleados e, productos p, ventas v
WHERE e.no_emepleado=v.empleados_no_empleado
AND p.clave_producto=v.productos_clave_producto
group by v.no_venta
ORDER BY e.no_emepleado;

#5. 
SELECT e.no_emepleado,e.nombre_e,e.apellido_p,e.apellido_m,count(*)
FROM empleados e,ventas v
WHERE e.no_emepleado=v.empleados_no_empleado
GROUP BY e.no_emepleado
ORDER BY count(*) desc;

#6. 
SELECT p.clave_producto,p.descripcion, i.existencia , i.inv_min,i.inv_max
FROM inventario i, productos p
WHERE p.clave_producto = i.productos_clave_producto
ORDER BY clave_producto desc;

#7.
SELECT c.no_cliente, c.nombre, c.a_paterno, c.a_materno, count(*) as compras
FROM ventas v, clientes c
WHERE c.no_cliente = v.clientes_no_cliente
GROUP BY c.no_cliente
ORDER BY count(*) desc; 

#8. 
SELECT c.no_cliente, c.nombre, c.a_paterno, c.a_materno, v.fecha, count(*) as compras
FROM ventas v, clientes c
WHERE c.no_cliente = v.clientes_no_cliente
AND v.fecha BETWEEN '2018-06-13' AND '2018-07-01'
GROUP BY c.no_cliente
ORDER BY count(*) desc;

#9. 
SELECT sum(p.precio_vta) as volumen_de_ventas
FROM ventas v, productos p
WHERE p.clave_producto = v.productos_clave_producto;

#10. 
SELECT AVG(precio_vta) as promedio
FROM ventas v, productos p
WHERE p.clave_producto = v.productos_clave_producto;

 #11 
SELECT avg(sumatoria)
FROM (
SELECT sum(p.precio_vta) as sumatoria
FROM ventas v, productos p, empleados e
WHERE p.clave_producto = v.productos_clave_producto
AND e.no_emepleado = v.empleados_no_empleado
GROUP BY e.no_emepleado) as inner_query;

# 12 
SELECT avg(sumatoria)
FROM (
SELECT sum(p.precio_vta) as sumatoria
FROM ventas v, productos p, clientes c
WHERE p.clave_producto = v.productos_clave_producto
AND c.no_cliente = v.clientes_no_cliente
GROUP BY c.no_cliente) as inner_query;

# 13 
SELECT max(suma)
FROM (
SELECT sum(p.precio_vta) as suma
FROM productos p, ventas v
WHERE p.clave_producto = v.productos_clave_producto
GROUP BY p.clave_producto)as inner_query;

/* 14 */
SELECT pr.no_proveedor, p.clave_producto,p.descripcion, min(pr.precio)
FROM productos p, proveedor pr
WHERE pr.clave_producto = p.clave_producto
GROUP BY p.clave_producto
ORDER BY pr.precio desc;

/* 15 */
SELECT p.clave_producto, p.descripcion, (i.existencia-i.inv_min) as ventas_profetizadas
FROM productos p,inventario i
WHERE p.clave_producto = i.productos_clave_producto
AND i.existencia > i.inv_min
ORDER BY p.clave_producto;