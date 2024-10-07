/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package empleado;

import java.util.ArrayList;
import java.util.Scanner;
 
public class GestiónEmpleados {
        public static int opcion=0;
	public static ArrayList<Empleado> Empleados = new ArrayList<Empleado>();
	static Scanner entrada = new Scanner(System.in);
	public static String nifintro="";
	public static String nombreintro="";
	public static String fechaintro="";
        public static int borrar;
        public static int porcentaje,empleado_numero;
	public static void main(String[] args) {
		crearEmpleados();
		while(opcion != 12){
            System.out.println("Bienvenido a la aplicación.\n"
                + "1.Dar de alta a un empleado.\n"
                + "2.Dar de baja a un empleado.\n"
                + "3.Modificar los datos de un empleado.\n"
                + "4.Modificar el salario de un empleado.\n"
                + "5.Modificar el salario de todos los empleados.\n"
                + "6.Listado de empleados ordenados por apellido y nombre.\n"
                + "7.Listado de empleados ordenados por Numero de empleado.\n"
                + "8.Buscar un empleado.\n"
                + "9. Consulta salarios.\n"
                + "10.Inserta automatica de empleados.\n"
                + "11.Mostrar empleados por dni."
                + "12.Busqueda avanzada. "
                + "13.Salir del programa. ");
            opcion=entrada.nextInt();
		Empleado emp;
		ArrayList<Empleado>ArrEmp;
		switch (opcion) {
		case 1:
			crearEmpleados();
			break;
		case 2:
                    System.out.println("Digite el numero de empleado que quiere eliminar: ");
                    borrar=entrada.nextInt();
                    Empleado(borrar)=null;
                    break;
		case 3:
			System.out.println("Introduce un nombre");
			nombreintro=entrada.nextLine();
			emp = ObtenerEmpleadoNombre(nombreintro);
			mostrarEmpleado(emp);
			break;
		case 4:
                        System.out.print("Digite el numero de empleado al que quiere aumentar el sueldo: ");
                        empleado_numero=entrada.nextInt();
			System.out.println("Digite el porcentaje para aumentar el sueldo: ");
			porcentaje=entrada.nextInt();
                        porcentaje=porcentaje/100+1;
			emp(salario)=
			break;
		case 5:
			System.out.print("Digite el numero de empleado al que quiere aumentar el sueldo: ");
                        empleado_numero=entrada.nextInt();
			System.out.println("Digite el porcentaje para aumentar el sueldo: ");
			porcentaje=entrada.nextInt();
                        porcentaje=porcentaje/100+1;
                        for (int i = 0; i < Empleados.size(); i++)
			break;
		case 6:
			System.out.println("Introduce un nombre");
			nombreintro=entrada.nextLine();
			emp = ObtenerEmpleadoNombre(nombreintro);
			mostrarEmpleado(emp);
			break;
                case 7:
                       System.out.println("Introduce un numero de empleado");
			empleado_numero=entrada.nextInt();
			emp = ObtnerEmpleadonumeroempleado(nifintro);
			mostrarEmpleado(emp);
			break;
                case 8: System.out.println("Introduce un nombre");
			nombreintro=entrada.nextLine();
			emp = ObtenerEmpleadoNombre(nombreintro);
			mostrarEmpleado(emp);
			break;
                case 9:
			mostrarEmpleados();
			break;
                case 10: 
                        Empleado e1= new Empleado("Luis_Aguado_Diego","50489576r",0,1000,"informatica","13-10-93","13-10-2020",918987632);
                        Empleado e2= new Empleado("Kyshuo","99091998d",1,1000,"informatica","13-10-95","13-10-2010",918987633);
                        empleado e3= new Empleado("Jessica","8896852",2,1000,"ventas","13-10-96","13-10-2012",918987637);
                        break;
                case 11:
                        System.out.println("Introduce un dni");
			nifintro=dni.nextLine();
			emp = ObtnerEmpleadoDni(nifintro);
			mostrarEmpleado(emp);
			break;
                        
                case 12:
                        System.out.println("Introduce un nombre");
			nombreintro=entrada.nextLine();
			emp = ObtenerEmpleadoNombre(nombreintro);
			mostrarEmpleado(emp);
			break;
                
                case 13: 
                        System.out.println("Gracias por usar el sistema de gestión de Empleados :-)123456789p");
			break;
		default:
			System.out.println("El valor introducido no es válido.");
			break;
		}
		}
	}
 
	public static void crearEmpleados() {
		Empleado emp;
		String nombre_apellidos;
                String dni;
                int numEmpleado=2;
                float salario;
                String departamento;
                String fechaNacimiento;
                String fechaAlta;
                String direccion;
                int telefono;
                int eleccion;
		String letra = "";
		do {
			System.out.println("introduzca el nombre y apellidos");
			nombre_apellidos = entrada.nextLine();
			System.out.println("Introducza el dni");
			dni = entrada.nextLine();
			System.out.println("introduzca el salario");
			salario = entrada.nextFloat();
                        System.out.println("Selecciona un departamento:"
                                + "1.Informatica."
                                + "2. ventas."
                                + "3. administracion.");
                        eleccion=entrada.nextInt();
                        switch(eleccion){
                            case 1: 
                                departamento="informatica";
                                break;
                            case 2:
                                departamento="ventas";
                            case 3: 
                                departamento="administracion";
                        }
                        System.out.println("Digite la feha de nacimiento: ");
                        fechaNacimiento=entrada.nextLine();
                        System.out.println("Digite la fecha de alta: ");
                        fechaAlta=entrada.nextLine();
                        System.out.println("Digite la direccion: ");
                        direccion=entrada.nextLine();
                        System.out.println("digite el telefono: ");
                        telefono=entrada.nextInt();
                        numEmpleado++;
                        emp = new Empleado(nombre_apellidos,dni,numEmpleado,salario,departamento,fechaNacimiento,fechaAlta,direccion,telefono);
			Empleados.add(emp);
			System.out.println("¿Quiere introducir un nuevo empleado? (Y/N)");
			letra = entrada.nextLine();
		} while ((letra.equals("y")) || (letra.equals("Y")));
		mostrarEmpleados();
	}
 
	private static void mostrarEmpleados() {
		System.out.println("Mostrando...");
		for (int i = 0; i < Empleados.size(); i++)
			System.out.println("Nombre y apellidos = " + Empleados.get(i).getnombre_apellidos() + " DNI= " + Empleados.get(i).getdni()
					+ " Numero empleado= " + Empleados.get(i).getnumEmpleado()+ " Salario= " + Empleados.get(i).getsalario()
                                         + " departamento= " + Empleados.get(i).getdepartamento()+" Fecha de nacimieto= " + Empleados.get(i).getfechaNacimiento()
                                         +" Fecha de Alta = " + Empleados.get(i).getfechaAlta()+" Direccion= " + Empleados.get(i).getdireccion()
                                        +" Telefono =" + Empleados.get(i).gettelefono());
	}
 
	private static void mostrarEmpleado(Empleado emp){
			System.out.println("Nombre y apellidos = " + Empleados.get().getnombre_apellidos() + " DNI= " + Empleados.get().getdni()
					+ " Numero empleado= " + Empleados.get().getnumEmpleado()+ " Salario= " + Empleados.get().getsalario()
                                         + " departamento= " + Empleados.get().getdepartamento()+" Fecha de nacimieto= " + Empleados.get().getfechaNacimiento()
                                         +" Fecha de Alta = " + Empleados.get().getfechaAlta()+" Direccion= " + Empleados.get().getdireccion()
                                        +" Telefono =" + Empleados.get().gettelefono());
	}
 
	private static void mostrarListaEmpleadosFecha(ArrayList<Empleado> emp){
		for (int i = 0; i < emp.size(); i++)
			System.out.println("Nombre y apellidos = " + Empleados.get(i).getnombre_apellidos() + " DNI= " + Empleados.get(i).getdni()
					+ " Numero empleado= " + Empleados.get(i).getnumEmpleado()+ " Salario= " + Empleados.get(i).getsalario()
                                         + " departamento= " + Empleados.get(i).getdepartamento()+" Fecha de nacimieto= " + Empleados.get(i).getfechaNacimiento()
                                         +" Fecha de Alta = " + Empleados.get(i).getfechaAlta()+" Direccion= " + Empleados.get(i).getdireccion()
                                        +" Telefono =" + Empleados.get(i).gettelefono());
	}
 
	private static Empleado ObtnerEmpleadoDni(String dni) {
		Empleado empleado = new Empleado();
		for (int i = 0; i < Empleados.size(); i++) {
			if (dni.equals(Empleados.get(i).getdni())) {
				empleado = Empleados.get(i);
			}
		}
		return empleado;
	}
 
	private static Empleado ObtenerEmpleadoNombre(String nombre_apellidos) {
		Empleado empleado = new Empleado();
		for (int i = 0; i < Empleados.size(); i++) {
			if (nombre_apellidos.equals(Empleados.get(i).getnombre_apellidos())) {
				empleado = Empleados.get(i);
			}
		}
 
		return empleado;
	}
 
	private static Empleado ObtenerEmpleadoFechaContrato(String fechaAlta) {
		Empleado empleado = new Empleado();
		for (int i = 0; i < Empleados.size(); i++) {
			if (fechaAlta.equals(Empleados.get(i).getfechaAlta())) {
				empleado = Empleados.get(i);
			}
		}
		return empleado;
	}
 
	private static ArrayList<Empleado> ObetnerListaEmpleadoFechaContrato(String fechaAlta){
		Empleado empleado = new Empleado();
		ArrayList<Empleado> emp = new ArrayList<Empleado>();
		for (int i = 0; i < Empleados.size(); i++) {
			if (fechaAlta.equals(Empleados.get(i).fechaAlta())) {
				empleado = Empleados.get(i);
				emp.add(empleado);
			}
		}
		return emp;
 
	}
        
	private static Empleado ObtnerEmpleadonumeroempleado(String dni) {
		Empleado empleado = new Empleado();
		for (int i = 0; i < Empleados.size(); i++) {
			if (dni.equals(Empleados.get(i).getnumEmpleado())) {
				empleado = Empleados.get(i);
			}
		}
		return empleado;
	}
 
}