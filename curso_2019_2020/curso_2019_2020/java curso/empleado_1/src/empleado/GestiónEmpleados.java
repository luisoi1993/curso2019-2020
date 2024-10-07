/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package empleado;

import java.time.LocalDate;
import java.util.Scanner;
 
public class GestiónEmpleados {
        private static final int MAX_EMPLEADOS=100;
        static Empleado[] empleados= new Empleado[MAX_EMPLEADOS];
	static Scanner entrada = new Scanner(System.in);
	public static String nifintro="";
	public static String nombreintro="";
	public static String fechaintro="";
        public static int borrar;
        public static int porcentaje,empleado_numero;
	
        static void menu() {
		int opcion=0;
		while(opcion != 13){
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
		
		switch (opcion) {
		case 1:
			altaEmpleado();
			break;
		case 2:
                        dumy();
			break;
		case 3:
			dumy();
			break;
		case 4:
                        dumy();
			break;
		case 5:
			dumy();
			break;
		case 6:
			dumy();
			break;
                case 7:
                       dumy();
			break;
                case 8: dumy();
			break;
                case 9:
			dumy();
			break;
                case 10: 
                        dumy();
			break;
                case 11:
                       dumy();
			break;
                        
                case 12:
                        dumy();
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
 
	public static void dumy() {
		System.out.println("Este es el metodo dummy");
        }
        public static void altaEmpleado() {
		Empleado emp;
		String nombre;
                String apellidos;
                String dni;
                int numEmpleado=2;
                double salario;
                String departamento = null;
                String fechaNacimiento;
                LocalDate fechaAlta;
                String direccion;
                String telefono;
                int eleccion;
		String letra = "";
		do {
			System.out.println("introduzca el nombre: ");
			nombre = entrada.nextLine();
                        System.out.println("introduzca los apellidos: ");
			apellidos = entrada.nextLine();
			System.out.println("Introducza el dni");
			dni = entrada.nextLine();
			System.out.println("introduzca el salario");
			salario = entrada.nextDouble();
                        //No se como usar enum aqui.
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
                                break;
                            case 3: 
                                departamento="administracion";
                                break;
                            default: break;
                        }
                        System.out.println("Digite la feha de nacimiento: ");
                        fechaNacimiento=entrada.nextLine();
                        fechaAlta=LocalDate.now();
                        System.out.println("Digite la direccion: ");
                        direccion=entrada.nextLine();
                        System.out.println("digite el telefono: ");
                        telefono=entrada.nextLine();
                        numEmpleado++;
                        emp = new Empleado(nombre,apellidos,dni,numEmpleado,salario,departamento,fechaNacimiento,fechaAlta,direccion,telefono);
			Empleado.add(emp);
			System.out.println("¿Quiere introducir un nuevo empleado? (Y/N)");
			letra = entrada.nextLine();
		} while ((letra.equals("y")) || (letra.equals("Y")));
		mostrarEmpleados();
	}
        private static void mostrarEmpleados() {
		System.out.println("Mostrando...");
		for (int i = 0; i < Empleado.size(); i++){
			System.out.println("Nombre  = " + Empleado.get(i).getnombre() //No se por que me da error
                                +"Apellidos ="+ Empleado.get(i).getapellidos()
                                + " DNI= " + Empleado.get(i).getdni()
                                + " Numero empleado= " + Empleado.get(i).getnumEmpleado()
                                + " Salario= " + Empleado.get(i).getsalario()
                                + " departamento= " + Empleado.get(i).getdepartamento()
                                +" Fecha de nacimieto= " + Empleado.get(i).getfechaNacimiento()
                                +" Fecha de Alta = " + Empleado.get(i).getfechaAlta()
                                +" Direccion= " + Empleado.get(i).getdireccion()
                                +" Telefono =" + Empleado.get(i).gettelefono());
                }
        }
	public static void main(String[] args){
            menu();
        }
 
	
 
}