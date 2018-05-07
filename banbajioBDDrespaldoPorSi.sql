SELECT * from cliente;

select *
from tel_cliente;
/*insert into tel_cliente(no_cliente, telefono)
values (16550474, '6142496957');*/

select *
from tel_cliente;

select *
from cliente, tel_cliente
where cliente.no_cliente = tel_cliente.no_cliente; 

select sum(saldo) as totalbanco 
from cuenta, cliente
where cuenta.cliente_no_cliente = cliente.no_cliente
order by cliente.a_paterno;

select *
from cuenta c, sucursal s
where c.sucursal_no_sucursal = s.no_sucursal;

select s.nombre, count(*)
from cuenta c, sucursal s
where c.sucursal_no_sucursal = s.no_sucursal
group by s.no_sucursal;

select s.nombre, sum(saldo)
from cuenta c, sucursal s
where c.sucursal_no_sucursal = s.no_sucursal
group by s.no_sucursal;

select *
from cuenta c, sucursal s, cliente cl
where c.sucursal_no_sucursal = s.no_sucursal
and c.cliente_no_cliente = cl.no_cliente;

select * from empleado;

select *
from empleado e, sucursal s
where e.sucursal_no_sucursal = s.no_sucursal;

select * from transaccion;
select * from movimiento;

select *
from transaccion t, movimiento m
where t.movimiento_id_movimiento = m.id_movimiento
and (fecha >= '2018-04-01' and fecha <= '2018-04-30')
order by t.cuenta_no_cuenta;

select m.descripcion, count(*) as num_movimiento, sum(t.cantidad)
from transaccion t, movimiento m
where t.movimiento_id_movimiento = m.id_movimiento
group by m.id_movimiento;

select * 
from cliente c, cuenta cn, tipo_cuenta tc, sucursal s
where c.no_cliente = cn.cliente_no_cliente
and cn.tipo_cuenta_no_tipo = tc.no_tipo
and cn.sucursal_no_sucursal = s.no_sucursal;

select c.no_cliente, c.nombre, c.a_paterno, cn.no_cuenta, cn.saldo, tc.descripcion, s.nombre
from cliente c, cuenta cn, tipo_cuenta tc, sucursal s
where c.no_cliente = cn.cliente_no_cliente
and cn.tipo_cuenta_no_tipo = tc.no_tipo
and cn.sucursal_no_sucursal = s.no_sucursal 
group by s.no_sucursal;

select s.nombre, count(*) as num_cuentas, sum(cn.Saldo)
from cliente c, cuenta cn, tipo_cuenta tc, sucursal s
where c.no_cliente = cn.cliente_no_cliente
and cn.tipo_cuenta_no_tipo = tc.no_tipo
and cn.sucursal_no_sucursal = s.no_sucursal 
group by s.no_sucursal;

insert into transaccion (no_transaccion, cantidad, fecha, movimiento_id_movimiento, cuenta_no_cuenta)
values (19, 45000, '2018-05-21', 2, 16550474);

select*
from cliente
where a_paterno like 'm%';

update cliente
set nombre=upper(nombre),a_paterno=upper(a_paterno),a_materno=upper(a_materno);

select*
from transaccion t, cuenta cn, movimiento m,
tipo_cuenta tp, sucursal s
where t.cuenta_no_cuenta=cn.no_cuenta
 and t.movimiento_id_movimiento=m.id_movimiento
  and cn.tipo_cuenta_no_tipo=tp.no_tipo
   and cn.sucursal_no_sucursal=s.no_sucursal;

select s.nombre,m.descripcion,sum(t.cantidad)
from transaccion t, cuenta cn, movimiento m,
tipo_cuenta tp, sucursal s
where t.cuenta_no_cuenta=cn.no_cuenta
 and t.movimiento_id_movimiento=m.id_movimiento
  and cn.tipo_cuenta_no_tipo=tp.no_tipo
   and cn.sucursal_no_sucursal=s.no_sucursal
group by s.no_sucursal,m.id_movimiento ;
/*1.-*/
select c.no_cliente,c.nombre, cn.no_cuenta, tp.descripcion
from cuenta cn, tipo_cuenta tp, cliente c
where cn.tipo_cuenta_no_tipo=tp.no_tipo
	and cn.cliente_no_cliente=c.no_cliente
order by c.no_cliente;
/*2.-*/
select s.nombre  , e.nombre 
from sucursal s, empleado e
where e.sucursal_no_sucursal=s.no_sucursal
order by s.no_sucursal;

/*3.-*/
select m.descripcion, sum(t.cantidad) 
from movimiento m, transaccion t
where t.movimiento_id_movimiento=m.id_movimiento
group by m.descripcion;

/*4.-*/
select s.nombre,m.descripcion ,count(*), sum(t.cantidad)
from movimiento m, sucursal s,cuenta cn, transaccion t
where cn.sucursal_no_sucursal=s.no_sucursal
	and t.cuenta_no_cuenta=cn.no_cuenta
		and t.movimiento_id_movimiento=m.id_movimiento
group by s.no_sucursal, m.id_movimiento;

/*5.-*/
select c.no_cliente, c.nombre,c.a_paterno,c.a_materno,cn.no_cuenta, t.no_transaccion, t.cantidad, t.fecha, m.descripcion
from cuenta cn, cliente c, transaccion t, movimiento m
where t.movimiento_id_movimiento=m.id_movimiento
	and t.cuenta_no_cuenta=cn.no_cuenta
		and cn.cliente_no_cliente=c.no_cliente
group by c.no_cliente;

/*6.-*/
select tc.descripcion, m.descripcion, count(*), sum(t.cantidad) 
from tipo_cuenta tc, movimiento m,transaccion t,cuenta cn, cliente c
where cn.tipo_cuenta_no_tipo=tc.no_tipo
	and t.movimiento_id_movimiento=m.id_movimiento
		and t.cuenta_no_cuenta=cn.no_cuenta
        and cn.cliente_no_cliente=c.no_cliente
group by tc.no_tipo;

/*7.-*/
select s.nombre, tc.descripcion, count(*)
from cuenta cn, sucursal s, tipo_cuenta tc
where cn.sucursal_no_sucursal=s.no_sucursal
and cn.tipo_cuenta_no_tipo=tc.no_tipo
group by s.no_sucursal, tc.no_tipo;

/*8.-*/
select c.nombre,c.a_paterno,c.a_materno, max(cn.saldo) "Saldo" 
from cliente c, cuenta cn
where cn.cliente_no_cliente=c.no_cliente
order by cn.saldo;




