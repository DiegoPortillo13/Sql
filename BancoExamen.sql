#Examen BDD
#1.- Cuentas de cada cliente
select c.no_cliente, c.nombre, c.a_paterno, c.a_materno, cn.no_cuenta, cn.tipo_cuenta_no_tipo, tp.descripcion, cn.fecha_apertura
from cliente c, cuenta cn, tipo_cuenta tp
where cn.cliente_no_cliente=c.no_cliente
	and cn.tipo_cuenta_no_tipo=tp.no_tipo
order by c.no_cliente;


#2.- Saldo de un cliente en especifico
select  c.no_cliente, c.nombre, c.a_paterno, c.a_materno, cn.no_cuenta, cn.tipo_cuenta_no_tipo, cn.saldo
from cliente c,cuenta cn
where cn.cliente_no_cliente=c.no_cliente
 and c.no_cliente like '%0'
order by c.no_cliente;

#3.- Lista de los empleados por sucursal
select s.nombre  , e.nombre, e.rfc 
from sucursal s, empleado e
where e.sucursal_no_sucursal=s.no_sucursal
order by s.no_sucursal;

#4.- Estado de cuenta por cliente 

#5.- Movimientos de saldo por cliente-cuenta
select c.no_cliente, c.nombre, c.a_paterno, c.a_materno, cn.no_cuenta, m.descripcion,t.cantidad
from cliente c, cuenta cn, transaccion t,movimiento m
where cn.cliente_no_cliente=c.no_cliente
 and t.cuenta_no_cuenta=cn.no_cuenta
  and t.movimiento_id_movimiento=m.id_movimiento
order by t.cantidad;

#6.- movimientos por sucursal
select s.nombre,m.descripcion ,count(*), sum(t.cantidad)
from movimiento m, sucursal s,cuenta cn, transaccion t
where cn.sucursal_no_sucursal=s.no_sucursal
	and t.cuenta_no_cuenta=cn.no_cuenta
		and t.movimiento_id_movimiento=m.id_movimiento
group by s.no_sucursal, m.id_movimiento;


#7.- numero de cuentas por tipo de cuenta
select  tc.descripcion, count(*)
from cuenta cn,  tipo_cuenta tc
where cn.tipo_cuenta_no_tipo=tc.no_tipo
group by tc.no_tipo;


#8.- cliente que tiene mas ahorro
select c.no_cliente, c.nombre, c.a_paterno, c.a_materno, cn.no_cuenta, cn.saldo
from cliente c, cuenta cn, tipo_cuenta tp
where cn.cliente_no_cliente=c.no_cliente
	and cn.tipo_cuenta_no_tipo=tp.no_tipo
		and cn.tipo_cuenta_no_tipo like '%1'
order by cn.saldo desc;


#9.- Sucursal que mas Capiyal tiene


#10.- Conocer el numero de movimientos por tipo de cuenta
select tc.descripcion, m.descripcion, count(*), sum(t.cantidad) 
from tipo_cuenta tc, movimiento m,transaccion t,cuenta cn, cliente c
where cn.tipo_cuenta_no_tipo=tc.no_tipo
	and t.movimiento_id_movimiento=m.id_movimiento
		and t.cuenta_no_cuenta=cn.no_cuenta
        and cn.cliente_no_cliente=c.no_cliente
group by tc.no_tipo;