#1.	

update asignatura set costebasico = costebasico*1.2
where idtitulacion in (select idtitulacion from titulacion where nombre like 'Quimicas')
and idasignatura in (select idasignatura from alumno_asignatura
						group by idasignatura
						having count(*) >2);

# 2.	

insert into titulacion values ('170000','Informatica');
insert into asignatura select '170001','Bases de Datos',4.5,1,70,idprofesor,'170000',1
from persona inner join profesor on persona.dni=profesor.dni
where persona.nombre like 'Luis'
and persona.apellido like 'RamĂ­rez';
 
  
# 3. 
Delete from alumno_asignatura
where idAlumno like 'A131313'
and idasignatura in (select idasignatura from asignatura where nombre like 'Contabilidad');


#4.  

alter table persona add column comision numeric(6,2) default 0; 
create table persona2 select * from persona;

update persona
set comision = 0.05*(select sum(costebasico) from persona2 inner join profesor on persona2.dni=profesor.dni 
					inner join asignatura on asignatura.idprofesor=profesor.idprofesor
					inner join alumno_asignatura aa on aa.idasignatura=asignatura.idasignatura
					where persona.dni=profesor.dni)
where dni in (select dni from profesor);



# 5. 

create table alumno_asignatura2 select * from alumno_asignatura;
update alumno_asignatura
set numeromatricula=numeromatricula+1
where idasignatura in (select a.idasignatura from alumno_asignatura2 aa inner join asignatura a 
						on aa.idasignatura=a.idasignatura
                        inner join titulacion t on a.idtitulacion=t.idtitulacion
                        where t.nombre like 'MatemĂĄticas'
                        and a.curso=1);
                        