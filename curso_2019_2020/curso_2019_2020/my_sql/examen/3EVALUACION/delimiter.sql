#Crea un procedimiento que inserte una categoría en
#la tabla Categorías, a partir de los datos que
#recibe como parámetros de entrada, controlando
#que el id como el nombre no se repitan. 

delimiter | 
create procedure insertarCategoria(id int(10),nomb varchar(50),descrip varchar(50)) begin 
if exists (select * from categorias where idCategoria=id and nombre like nomb) then 
select 'La categoria ya existe con ese nombre y código'; elseif exists (select * from categorias where idCategoria=id) then 
select 'La categoria ya existe con ese codigo'; else 
if exists (select * from categorias where nombre=nomb) then 
select 'El nombre ya existe'; else 
insert into categorias values (id,nomb,descrip); end if; end if; end | delimiter ; 


#Crea un procedimiento almacenado que permita buscar una categoría por su nombre. 

delimiter | 
create procedure buscarCategoria(nomb varchar(50)) begin 
if exists (select * from categorias where nombre=nomb) then 
select * from categorias where nombre=nomb; else 
select ‘La categoría que buscas no existe’; end if; end | delimiter ;


#Crea un procedimiento almacenado que permita 
#eliminar una categoría a partir de su id, 
#comprobando que dicho id existe y mostrando
#un mensaje de error en caso contrario. 

delimiter | 
create procedure eliminarCategoria(id int) begin 
if exists (select * from categorias where idCategoria=id) then 
begin 
delete from categorias where idCategoria=id; select 'Eliminado el elemento’; end; else 
select 'Error: esa categoría no existe'; end if; end | delimiter ; 

#Crea un procedimiento almacenado que permita modificar
#el nombre y la descripción de una categoría,
#verificando que no se repite el nombre de la categoría. 

delimiter | create procedure modificaCategoria(id int, nomb varchar(50),descrip varchar(50)) begin 
if not exists (select * from categorias where nombre=nomb) then 
begin 
if exists (select * from categorias where idCategoria=id) then 
begin 
update categorias set nombre=nomb, descripcion=descript 
where idCategoria=id ; select 'Categoria modificada correctamente’; end; else 
select ' El id de la categoria a modificar no existe’; end if; end; else 

select 'Error: ese nombre de categoría ya existe'; end if; end | delimiter ; 

# Crea un procedimiento que visualice todas las películas cuyo coste de
#reemplazo sea superior a un valor que se pasará como parámetro de entrada.
#¿Cuántas películas tienen un coste de reemplazo superior a 20€?

delimiter |

create procedure visualizar_peliculas_coste(in coste_min decimal(5,2),out num_pelis smallint)
begin
  
   if coste_min < 0.0 then
      select "El coste de reemplazo no puede ser negativo" as Peliculas;
   else
      select count(*) from film where replacement_cost > coste_min into num_pelis;
      if num_pelis = 0 then
         select concat("No hay ninguna pelicula con coste de reemplazo superior a ",coste_min) as Peliculas;
	  else
          select * from film where replacement_cost > coste_min;
	  end if;
   end if;
end |

delimiter ;

call visualizar_peliculas_coste(20,@numero);
select @numero;
drop procedure visualizar_peliculas_coste;

# Crea un procedimiento que visualice todas las películas
#cuyo coste de reemplazo esté comprendido entre dos cantidades
#que se pasarán como parámetros de entrada. ¿Cuántas películas
#tienen un coste de reemplazo superior a 20€ e inferior a 21,99?

delimiter |

create procedure visualizar_peliculas_coste_rango(in coste_min decimal(5,2),in coste_max decimal(5,2),out num_pelis smallint)
begin
   declare aux decimal(5,2);
   if coste_min < 0.0 or coste_max < 0.0 then
      select "El coste de reemplazo no puede ser negativo" as Peliculas;
   else
	  if coste_min > coste_max then   # Intercambiamos los límites si no están ordenados asc
         set aux=coste_min;
         set coste_min=coste_max;
         set coste_max=aux;
	  end if;
      select count(*) from film where replacement_cost between coste_min and coste_max into num_pelis;
      if num_pelis = 0 then
         select concat("No hay ninguna pelicula con coste de reemplazo entre ",coste_min," y ",coste_max) as Peliculas;
	  else
          select * from film where replacement_cost between coste_min and coste_max;
	  end if;
   end if;
end |

delimiter ;

call visualizar_peliculas_coste_rango(50,80,@numero);
select @numero;
drop procedure visualizar_peliculas_coste_rango;

# Crea un procedimiento que reciba como parámetros de entrada
#el continente y la lengua y obtenga todos los países de ese continente que hablen esa lengua.
#¿Qué países de Asia tienen como lengua entre otras el inglés? Nota: El tipo enum es
# compatible con el tipo varchar.

delimiter |

create procedure visualizar_paises_lengua(in continente varchar(50),in lengua varchar(50))
begin
	if not exists (select * from country where continent like continente) then
	   select concat('El continente ',continente," no existe") as Paises;
   elseif not exists (select * from countrylanguage where language like lengua) then
		select concat('La lengua ',lengua,' no existe en ningún pais') as Paises;
   else
	   select country.name, countrylanguage.language from country inner join countrylanguage on country.code=countrylanguage.countrycode 
       where continent like continente and language like lengua;
   end if;

end |

delimiter ;

call visualizar_paises_lengua('Asia','English');
call visualizar_paises_lengua('Europe','Spanish');
drop procedure visualizar_paises_lengua;

# Crea una función que calcule el volumen de una esfera cuyo radio de tipo FLOAT se pasará como parámetro. 
# Realiza una consulta después para calcular el volumen de una esfera de radio 5.

delimiter |

create function calcula_volumen_esfera(radio double(5,2)) returns double(8,2)
deterministic
begin
if radio < 0 then
	return 0.0;
end if;
return 4/3*3.1416*radio*radio*radio;
end |

delimiter ;

select calcula_volumen_esfera(5.0);
drop function calcula_volumen_esfera;

# Crea un procedimiento almacenado (SP) que cambie el mail de un cliente, tabla customer, por otro que se pasarรก como parรกmetro. 
# El SP recibirรก dos parรกmetros, el identificador del cliente y el nuevo mail. Ejecuta el SP con valores concretos.

delimiter |

create procedure actualiza_correo_cliente(in cliente smallint(5),in correo varchar(50))
deterministic
begin
   if not exists (select * from customer where customer_id like cliente) then
	   select concat('El cliente ',cliente," no existe") as Mensaje_error;
   else
       update customer
       set email=correo
       where customer_id like cliente;
	end if;
end |

delimiter ;

call actualiza_correo_cliente(3,"linda.WILLIAMS@sakilacustomer.org");

# Crea una función que devuelva el número de actor de la tabla actor, pasando como parámetros el apellido y nombre.

delimiter |

create function visualiza_actorID(nombre varchar(45),apellido varchar(45)) returns smallint(5)
deterministic
begin
   declare id smallint(5);
   set id = -1;   # Código de error.
   if exists (select * from actor where first_name like nombre) then
      if exists (select * from actor where last_name like apellido) then
		select actor_id from actor where first_name like nombre and last_name like apellido into id;
	  end if;
    end if;
    return id;
end |

delimiter ;

select visualiza_actorID("GRACE","MOSTEL") as actor;

# Crea un procedimiento que visualice las películas cuya categoría (comedia, drama, …) se pasa como parámetro. 
# Llama después a este procedimiento para obtener todas las películas de la categoría drama y de la categoría comedia. 
# ¿Qué ventaja le encuentras a realizar esta consulta de esta forma a realizarla de forma directa a través de sentencias SQL?

delimiter |

create procedure visualizar_peliculas_categoria(in categoria varchar(25))
deterministic
begin
   declare idcat tinyint(3);
   select category_id from category where name like categoria into idcat;
   if idcat is NULL then
	   select concat('La categoria ',categoria," no existe") as Mensaje_error;
   else
	 select * from film f inner join film_category fc on f.film_id=fc.film_id  
     where fc.category_id = idcat;
   end if;
end |

delimiter ;

call visualizar_peliculas_categoria("Drama");
drop procedure visualizar_peliculas_categoria;

# Crea un procedimiento que reciba dos parámetros de entrada, identificador de categoría e identificador de actor y obtenga los datos de las películas sobre esa categoría en las que ha trabajado ese actor.
# Prueba el ejemplo con el actor 182 y la categoría 2.

delimiter |
create procedure categoriaActor(in actor smallint(5), in categoria tinyint(3))
begin
    if not exists (select actor_id from film_actor where actor_id like actor) then
		select 'El identificador de actor no existe' as Mensaje_error;
    elseif not exists (select category_id from film_category where category_id like categoria) then
		select 'El identificador de categoría no existe' as Mensaje_error;
    else
		select * from film  								# Esta consulta puede construirse también con inner join.
        where film_id in (select film_id from film_actor where actor_id like actor)
		and film_id in (select film_id from film_category where category_id like categoria);
   end if;
end |
delimiter ;

call categoriaActor(182,2);
drop procedure categoriaActor;


# Modifica el procedimiento para que tenga 3 parámetros de entrada, nombre, apellidos del actor y nombre de la categoría y visualice 
# para un determinado actor y una determinada categoría, las películas en las que ha trabajado. 
# Realiza una versión sin llamar al procedimiento del ejercicio 14 y otra versión llamándolo. 
# Encuentra todas las películas de animación en las que ha trabajado el actor DEBBIE AKROYD. 
# Busca todas las películas Documentales en las que ha trabajado el actor ED CHASE.

# Opcion a

delimiter |
create procedure categoriaActor2(in nombreA varchar(45), in apellidoA varchar(45), in nombreC varchar(25))
begin
    if not exists (select actor_id from actor where first_name like nombreA and last_name like apellidoA) then
		select concat('El actor ', nombreA, ' ',apellidoA, ' no existe') as Mensaje_error;
    elseif not exists (select category_id from category where name like nombreC) then
		select concat('La categoría ',nombreC,' no existe') as Mensaje_error;
    else
		select * from film 
        where film_id in (select film_id from film_actor 
							where actor_id in (select actor_id from actor where first_name like nombreA and last_name like apellidoA))
							and film_id in (select film_id from film_category 
											where category_id in (select category_id from category where name like nombreC));
			
    end if;
end |

delimiter ;
drop procedure categoriaActor2;
call categoriaActor2('DDDEBBIE','AAAAKROYD','Animation');
call categoriaActor2('DEBBIE','AKROYD','AAAnimation');
call categoriaActor2('DEBBIE','AKROYD','Animation');

# Crea un procedimiento que reciba una cadena que puede contener letras y números y sustituya los números por  ‘ * ’. 
# Por ejemplo, si introducimos la cadena ‘12abcd23rts’ devolverá la cadena ‘**abcd**rts’. Utiliza las funciones de manejo de cadenas que incorpora MySQL:
# http://dev.mysql.com/doc/refman/5.7/en/string-functions.html

delimiter |
create procedure sin_numero(inout cadena varchar(50))
begin
	declare i int default 1;
	declare michar char(1);
	declare cadenafinal varchar(50) default cadena;
	while i <= char_length(cadena) do
		set michar = substring(cadena,i,1);
		if michar in ('1','2','3','4','5','6','7','8','9','0') then
			set cadenafinal = insert(cadenafinal,i,1,'*');
		end if;
		set i=i+1;
	end while;
    set cadena=cadenafinal;
end |
delimiter ;

set @cadena='Hola 2 que 3 tal 4';
# set @cadena='Hola que tal';
call sin_numero(@cadena);
select @cadena;

# Desarrolla una función que devuelva el número de años completos que hay entre dos fechas que se pasan como parámetros. 
# Utiliza la función DATEDIFF. 

DELIMITER |
CREATE FUNCTION anios_completos (fecha1 DATE, fecha2 DATE) returns int(11)
BEGIN
	DECLARE dias INT(11) DEFAULT 0;
    IF fecha1 >= fecha2 THEN
		SELECT datediff(fecha1,fecha2) into dias;
	ELSE
		SELECT datediff(fecha2,fecha1) into dias;
	END IF;
    set dias=truncate(dias/365,0);
    return dias;
END |

DELIMITER ;

drop function anios_completos;
SELECT anios_completos ('2014/06/15','2015/06/15') as Años;

# Escribe un procedimiento que permita borrar un actor cuyo identificador se pasará como parámetro. 
# Si el actor cuyo número se ha pasado como parámetro no existe, aparecerá un mensaje diciendo “Este actor no existe”. 
# Comprueba el funcionamiento del procedimiento. ¿Qué ocurre cuando se intenta borrar un actor que ya existe?

delimiter |

create procedure borrar_actor(in numero smallint(5))
begin
   declare nume smallint(5);
   select actor_id from actor where actor_id like numero into nume;
   if nume is null then
		select concat('El actor ',numero,' no existe') as Mensaje_error;
	else
		delete from actor where actor_id like numero;
	end if;
end |

delimiter ;

drop procedure borrar_actor;
call borrar_actor(-1);
describe actor;

# Escribe un procedimiento que añada una nueva entrada a la tabla film_category que guarda las categorías a las que pertenece cada película. 
# El procedimiento recibirá como parámetros el identificador de película y el nombre de la categoría. Deberían tenerse en cuenta las siguientes situaciones:
#	Si no existe la película correspondiente al número pasado como parámetro, se mostrará un mensaje diciendo ‘El film con nº x no existe’. 
#     X es el número de película pasado como parámetro y se abandonará el procedimiento en este caso.
#   Si no existe la categoría pasada como parámetro, se mostrará un mensaje diciendo ‘La categoría x no existe’, donde x es el nombre de categoría pasado 
#     como parámetro y se abandonará el procedimiento.
#   Si ya existe la entrada o fila que se pretende añadir a film_category, aparecerá un mensaje diciendo ‘la película x ya está registrada en esa categoría’. 
#     En caso contrario se procede al alta de dicha fila en la tabla film_category.
# Comprobar el procedimiento en las distintas situaciones.

# REALIZA DOS VERSIONES DEL EJERCICIO, UNA SIN UTILIZAR HANDLERS Y OTRA USÁNDOLOS.


# SIN HANDLERS

DELIMITER |
CREATE PROCEDURE addFilmCategory (IN idFilm smallint(5), IN nombreCat varchar(25))
BEGIN

DECLARE idCat tinyint(3);

IF EXISTS (Select * from film where film_id = idFilm) Then
  IF EXISTS(Select * from category where name like nombreCat) THEN
    IF NOT EXISTS (SELECT * from film_category where film_id = idFilm 
					and category_id = (SELECT category_id from category where name like nombreCat)) THEN
	  SELECT category_id from category where name like nombreCat INTO idCat;
      INSERT INTO film_category	values(idFilm, idCat, Current_date());
	ELSE
        select concat('La película ',nombreCat,' ya está registrada en esa categoria') as Mensaje_Error;
	 END IF;
  ELSE
    select concat('La categoria ',nombreCat,' No existe') as Mensaje_Error;
  END IF;
ELSE
  select concat('No existe la película con el número dado ',idFILM) as Mensaje_Error;
END IF;
END |

DELIMITER ;

# DROP PROCEDURE addFilmCategory;
CALL addFilmCategory (1,'Action');








 


