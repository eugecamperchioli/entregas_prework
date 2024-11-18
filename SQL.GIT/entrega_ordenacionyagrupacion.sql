
-- Ejercicio 1:  Selecciona el nombre de todos los álbumes y ordénalos alfabéticamente.
select "Title" 
from "Album" a 
order by "Title" ;

-- Ejercicio 2:  Encuentra el álbum con el mayor número de canciones.
select *
from "Track" t
order by "Composer" ;

select "AlbumId" , count("TrackId")
from "Track" t 
group by "AlbumId" 
limit 1;


-- Ejercicio 3:  Calcula la duración promedio, desviación estándar y varianza por compositor.
select "Composer" ,
avg("Milliseconds") as duracion_promedio,
stddev("Milliseconds") as desviacion_estandar, 
variance("Milliseconds") as varianza 
from "Track" t 
group by "Composer"
order by "Composer" ;


-- Ejercicio 4: Selecciona el título y el precio de las pistas, y limita los resultados a 10.
select "Name" , "UnitPrice" 
from "Track" t 
limit 10;
   

-- Ejercicio 5: Lista los nombres de los empleados y ordénalos por el ID del empleado en orden descendente.
select *
from "Employee" e ;

select "FirstName" , "EmployeeId" 
from "Employee" e 
order by "EmployeeId" desc ;

-- Ejercicio 6:  Muestra el número de géneros distintos disponibles en la base de datos.
select "Name" , count(distinct"Name")
from "Genre" g 
group by "Name" ;

-- Ejercicio 7: Selecciona el nombre del cliente y el país, limitando los resultados a 5, y ordena por el nombre del cliente.
select *
from "Customer" c ;

select "FirstName" , "Country" 
from "Customer" c 
order by "FirstName" 
limit 5;
    
-- Ejercicio 8: Muestra la cantidad total de clientes agrupados por país.
select "Country" , count(*)
from "Customer" c 
group by "Country";

-- Ejercicio 9: Obtén el total de importes de facturas para cada país y muestra solo aquellos con un total superior a 10,000.
select *
from "Invoice" i ;

select "BillingCountry" , sum("Total") 
from "Invoice" i 
group by "BillingCountry" 
having sum("Total") > 10.00 ;

-- Ejercicio 10: Encuentra los países donde el número total de clientes es mayor a 5. Muestra el país y el número de clientes.
select count("CustomerId") as numero_clientes , "Country" 
from "Customer" c 
group by "Country" 
having count("CustomerId") > 5; 

-- Ejercicio 11: Obtén la cantidad de pistas en cada tipo de medio (MediaType) que tienen una duración mayor a 250,000 milisegundos.
select *
from "Track" t ;

select count("TrackId") , "MediaTypeId" 
from "Track" t 
where "Milliseconds" > 250000 
group by "MediaTypeId" ;


-- Ejercicio 12: Lista el país y el número total de clientes que han sido asistidos por un representante de ventas específico, cuyo ID sea menor a 5.
select "Country" , count(distinct"CustomerId") 
from "Customer" c 
where "SupportRepId" < 5
group by "Country" ;
   

-- Ejercicio 13: Muestra los códigos postales (BillingPostalCode) de los clientes que han hecho más de 5 compras.
select "BillingPostalCode" , count("Total")
from "Invoice" i 
group by "BillingPostalCode" 
having count("Total") > 5;

-- Ejercicio 14: Encuentra la cantidad total de pistas en cada tipo de medio (MediaTypeId) donde el precio de la pista (UnitPrice) es mayor a 0.99 y la duración de la pista (Milliseconds) es mayor a 200,000. Muestra el tipo de medio y el número total de pistas.
select "MediaTypeId" as tipo_medio , sum("TrackId") 
from "Track" t 
where "UnitPrice" > 0.99 and "Milliseconds" > 200000
group by "MediaTypeId" ;

-- Ejercicio 15: Lista el país y el estado de los clientes que tienen el soporte asignado a un representante con ID mayor a 3 y cuyo nombre de empresa (Company) no es nulo. Muestra el país, el estado y el número de clientes.
select "State", "Country" , count(distinct"CustomerId") 
from "Customer" c 
where "SupportRepId" > 3 and "Company" is not null
group by "State" , "Country" ; 

