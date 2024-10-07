#1.
SELECT nombre,ciudad FROM equipos
WHERE nombre IN (SELECT nombre_equipo FROM jugadores
					  WHERE procedencia LIKE'spain');
					  
#2.
SELECT * FROM equipos
WHERE nombre LIKE 'h%s';

#3.
SELECT AVG(puntos_por_partido) FROM estadisticas
WHERE jugador IN(SELECT codigo FROM jugadores
					  WHERE nombre LIKE 'pau gasol');
					  

#4.
SELECT COUNT(DISTINCT nombre) FROM equipos
WHERE conferencia LIKE 'west';

#5.
SELECT * FROM jugadores 
WHERE procedencia LIKE 'arizona'
AND altura  >'6'
AND peso >100;

#6.
SELECT AVG(puntos_por_partido),jugador FROM estadisticas
WHERE jugador IN (SELECT codigo FROM jugadores
						WHERE nombre_equipo LIKE 'cavaliers')
GROUP BY jugador;

#7.
SELECT * FROM jugadores
WHERE nombre LIKE '___v%';
SELECT * FROM estadisticas;

#8.
SELECT COUNT(codigo),nombre_equipo FROM jugadores
WHERE nombre_equipo IN(SELECT nombre FROM equipos
							  WHERE conferencia LIKE 'west')
GROUP BY nombre_equipo;

#9.
SELECT COUNT(codigo) FROM jugadores
WHERE procedencia LIKE 'argentina';

#10.
SELECT MAX(puntos_por_partido) FROM estadisticas
WHERE jugador IN(SELECT codigo FROM jugadores
						WHERE nombre LIKE 'lebron james');
						
#11.
SELECT AVG(asistencias_por_partido) FROM estadisticas
WHERE temporada LIKE '07/08' AND jugador IN(SELECT codigo FROM jugadores
														  WHERE nombre LIKE 'jose calderon');
														  
#12.
SELECT puntos_por_partido FROM estadisticas 
WHERE temporada LIKE '07/08'
AND jugador IN (SELECT codigo FROM jugadores
					 WHERE nombre LIKE 'lebron james');
					 
#13.
SELECT COUNT(codigo),nombre_equipo FROM jugadores
WHERE nombre_equipo IN(SELECT nombre FROM equipos
							  WHERE conferencia LIKE 'west')
GROUP BY nombre_equipo;

#14.
SELECT AVG(rebotes_por_partido),jugador FROM estadisticas
WHERE jugador IN(SELECT codigo FROM jugadores
						WHERE nombre_equipo LIKE 'blazers')
GROUP BY jugador;

#15.
SELECT AVG(rebotes_por_partido),jugador FROM estadisticas 
WHERE jugador IN(SELECT codigo FROM jugadores
						WHERE nombre_equipo IN(SELECT nombre FROM equipos
										
														WHERE conferencia LIKE 'east'))
GROUP BY jugador;

#16.
SELECT AVG(rebotes_por_partido),jugador FROM estadisticas 
WHERE jugador IN(SELECT codigo FROM jugadores
						WHERE nombre_equipo IN(SELECT nombre FROM equipos
														WHERE ciudad LIKE 'los angeles'))
GROUP BY jugador; 

#17.
SELECT COUNT(codigo),nombre_equipo FROM jugadores
WHERE nombre_equipo IN(SELECT nombre FROM equipos
								WHERE division LIKE 'northwest')
GROUP BY nombre_equipo;

#18.
SELECT COUNT(codigo),procedencia FROM jugadores
WHERE procedencia LIKE 'spain' OR procedencia LIKE 'france'
GROUP BY procedencia;

#19.
SELECT COUNT(posicion),nombre_equipo FROM jugadores 
WHERE posicion LIKE 'c'
GROUP BY nombre_equipo;

#20.
SELECT MAX(altura),nombre FROM jugadores 
WHERE posicion LIKE 'C';

#21.
select Peso as libras, Peso*0.4535 as kilos from jugadores 
where Altura=(select max(Altura) from jugadores
				where posicion like 'C')
and posicion like 'C';

#22.
SELECT COUNT(nombre) FROM jugadores
WHERE nombre LIKE 'y%';

#23.
SELECT * FROM jugadores
WHERE codigo IN(SELECT jugador FROM estadisticas
					WHERE puntos_por_partido =0
					GROUP BY temporada);
					
#24.
select count(*),Division 
from jugadores inner join equipos 
	on equipos.Nombre=jugadores.Nombre_equipo 
group by Division;

#25.
select avg(Peso) as MediaLibras,avg(Peso*0.4535) as MediaKilos 
from jugadores where Nombre_equipo='Raptors';

#26.
select concat(nombre,'(',Nombre_equipo,')') from jugadores;
SELECT * FROM estadisticas;

#27.
SELECT MIN(puntos_local+puntos_visitante) FROM partidos;

#28.
SELECT * FROM jugadores
ORDER BY nombre LIMIT 10;

#29.
SELECT temporada,AVG(puntos_por_partido) FROM estadisticas
WHERE jugador IN(SELECT codigo FROM jugadores
						WHERE nombre LIKE 'kobe bryant')
GROUP BY temporada
ORDER BY AVG(puntos_por_partido) DESC LIMIT 1;

#30.
SELECT COUNT(*),nombre_equipo FROM jugadores 
WHERE nombre_equipo IN (SELECT nombre FROM equipos
							  WHERE conferencia LIKE 'east')
GROUP BY nombre_equipo;

#31.
SELECT COUNT(nombre),conferencia FROM equipos
GROUP BY conferencia;

#32.
SELECT division FROM equipos
WHERE conferencia LIKE 'EAST';

#33.			  
select Nombre from jugadores 
where codigo in(Select jugador 
		      from estadisticas 
			 where rebotes_por_partido =(select max(rebotes_por_partido)
										from estadisticas
                                        where jugador in (select codigo
															from jugadores
                                                            where nombre_equipo like 'suns'))
			and jugador in (select codigo from jugadores where nombre_equipo like 'suns'));  
			
#34.
select Nombre from jugadores inner join estadisticas 
on estadisticas.jugador=jugadores.codigo 
where Puntos_por_partido=(select max(Puntos_por_partido) from estadisticas);

#35.
select length(Nombre),Nombre
from jugadores where Nombre_equipo='Grizzlies';

#36.
select length(concat(Ciudad,' ',Nombre)),concat(Ciudad,' ',Nombre) from equipos 
where length(concat(Ciudad,' ',Nombre))=(
   select max(length(concat(Ciudad,' ',Nombre))) from equipos);

SELECT * FROM estadisticas;
SELECT * FROM jugadores;
SELECT * FROM equipos;