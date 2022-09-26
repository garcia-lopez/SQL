--Crear base de dato
create database BDAlmacen
go
-- Poner uso la base de datos
use BDAlmacen
go
--una tabla es un coleccion de resgistros, columnas - campos, filas - registros, cada registro tiene su propio identificador unico, no puede repetirse más de una vez

--Crear una tabla
create table Producto( 
    idProd int primary key not null,
	nombreProd nvarchar(60) not null,  --no existe string así que se usa nvarchar
	precioProd numeric(18, 2) not null, --significa que va a tener 18 numeros antes de la coma y dos decimales despues 
	existenciaProd int not null default 0,
	existMinProd int not null default 0,
	estadoProd bit default 'true' -- boolean no existe, se llama bit
)
go
-- CRUD
--create o insertar registros
/* Comando Insert into nombreTabla(campo1, campo2,..., campoN)
values(dato1, dato2,..., datoN)*/

insert into Producto( idProd, nombreProd, precioProd, existenciaProd, existMinProd)
values(1, 'Cafe', 85, 5, 3)
 --el estado no va porque por defecto es verdadero

--Read Select o Ver
/* select * from nombreTabla */ --el asterisco signifca todo

select * from Producto
go

--Insertar mas registros
insert into Producto(idProd, nombreProd, precioProd, existenciaProd, existMinProd)
values(2, 'Limón', 5, 10, 5),
      (3, 'Arroz Libra', 25, 200, 100),
	  (4, 'Helado', 10, 10, 3)

--Mostrar registros por alias

select idProd as N'Código', nombreProd as N'Producto',
precioProd as N'Precio', existenciaProd as N'Existencia Actual',
existenciaProd N'Minimo'
from Producto --la N es de nvarchar

--Update Actualizar
update Producto set nombreProd = 'Helado Pie de Limón'
where idProd = 4

--Delete 
delete from Producto where idProd = 2