
-- Ejercicio  1: Encuentra el nombre de las pistas y los títulos de los álbumes a los que pertenecen.
select t."Name" , a."Title" 
from "Track" as t 
inner join "Album" as a 
on t."AlbumId" = a."AlbumId" ;

-- Ejercicio 2: Lista los nombres de los artistas y los títulos de sus álbumes. Ordena los resultados por artista.
select t."Composer", a."Title" 
from "Track" as t 
inner join "Album" as a 
on t."AlbumId" = a."AlbumId"
order by "Composer" ;


-- Ejercicio 3: Encuentra los nombres de los clientes y los totales de sus facturas. Extrae solo los 5 clientes con mayor total. 
select concat(c."FirstName",' ',c."LastName") as nombre_completo ,  sum(i."Total") 
from "Customer" as c
inner join "Invoice" as i 
on c."CustomerId"= i."CustomerId"
group by concat(c."FirstName",' ',c."LastName")
order by sum(i."Total")
limit 5; 

-- Ejercicio 4: Lista los nombres de los empleados y los nombres de los clientes que les han sido asignados.
select concat(c."FirstName",' ',c."LastName") as nombre_cliente , concat(e."FirstName",' ',e."LastName") as nombre_empleado  
from "Customer" as c 
inner join "Employee" as e 
on c."SupportRepId" = e."EmployeeId" ;

-- Ejercicio 5: Muestra los ID de las facturas y los nombres de las pistas incluidas en esas facturas.
select il."InvoiceId" as ID_facturas , t."Name" as nombre_pistas
from "Track" as t 
inner join "InvoiceLine" as il 
on t."TrackId" = il."TrackId" ;

-- Ejercicio 6: Encuentra los nombres de los artistas y los géneros de sus pistas.
select a."Name" as nombre_artista , t."GenreId" as genero
from "Track" as t 
join "Album" as a2 
ON t."AlbumId" = a2."AlbumId" 
join "Artist" a ON a."ArtistId" = a2."ArtistId" ;

--  Ejercicio 7: Muestra los nombres de las pistas y el tipo de medio en el que están disponibles.
select t."Name" as nombre_pistas , mt2."Name" as tipo_medio
from "MediaType" as mt2 
join "Track" as t 
on t."MediaTypeId" = mt2."MediaTypeId" ;

-- Ejercicio 8: Encuentra todas las pistas y, si existen, muestra los nombres de los géneros a los que pertenecen. Incluye también las pistas que no tienen un género asignado.**
select t."Name" as nombre_pistas , g."Name" as nombre_genero
from "Track" as t
left join "Genre" as g 
on t."GenreId" = g."GenreId" ;

-- Ejercicio 9: Muestra todos los clientes y, si existen, muestra las facturas que han realizado. Incluye también los clientes que no tienen ninguna factura.
select concat(c."FirstName",' ',c."LastName") as nombre_cliente ,  i."InvoiceId" as facturas 
from "Customer" as c
left join "Invoice" as i 
on c."CustomerId" = i."CustomerId"  ;


-- Ejercico 10: Encuentra todos los álbumes y, si existen, muestra los nombres de los artistas que los crearon. Incluye también los álbumes que no tienen un artista asignado (aunque en este caso en la base de datos de Chinook, todos los álbumes tienen un artista asignado).
select a2."Name" as nombre_artista , a."Title" as nombre_album
from "Album" as a 
left join "Artist" as a2 
on a."ArtistId" = a2."ArtistId" ;

-- Ejercicio 11: Cuenta cuántas pistas hay en cada género. Ordena los generos en función del número de canciones de mayor a menor. 
select count(t."TrackId")  as total_pistas , g."Name" as genero
from "Track" as t
left join "Genre" as g
on t."GenreId" = g."GenreId" 
group by g."Name" 
order by count(t."TrackId") desc ; 

--  Ejercicio 12: Muestra los títulos de los álbumes y la duración total de todas las pistas en cada álbum.
select a."Title" as titulo_album , sum(t."Milliseconds") as duracion_total 
from "Album" as a 
join "Track" as t
on a."AlbumId" = t."AlbumId" 
group by a."Title" 
order by sum(t."Milliseconds") ;

-- Ejercicio 14: Encuentra los nombres de los clientes y el total gastado por cada uno.
select concat(c."FirstName",' ',c."LastName") as nombre_cliente , sum(i."Total") 
from "Customer" as c
left join "Invoice" as i
on c."CustomerId" = i."CustomerId" 
group by concat(c."FirstName",' ',c."LastName") 
order by  sum(i."Total") ;

-- Ejercicio 15: Encuentra todos los empleados y, si existen, muestra los nombres de los clientes que tienen asignados. Incluye también los empleados que no tienen clientes asignados.
select concat(e."FirstName",' ',e."LastName") as nombre_empleado , concat(c."FirstName",' ',c."LastName") as nombre_cliente 
from "Employee" as e
left join "Customer" as c 
on e."EmployeeId" = c."SupportRepId" ;



