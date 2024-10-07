
import java.util.ArrayList;
import java.util.Scanner;
 
public class GestiónEmpleados {
 
	public static ArrayList<Empleado> Empleados = new ArrayList<Empleado>();
	static Scanner sc = new Scanner(System.in);
	public static String eleccion = "";
	public static String nifintro="";
	public static String nombreintro="";
	public static String fechaintro="";
 
 
	public static void main(String[] args) {
		crearEmpleados();
		do{
		System.out.println("Elija que opción quiere..");
		System.out.println("Mostrar TODOS los empleados --> 1");
		System.out.println("Mostrar empleado por NIF --> 2");
		System.out.println("Mostrar empleado por Nombre --> 3");
		System.out.println("Mostrar empelado por Fecha --> 4");
		System.out.println("Mostrar lista de empelados por Fecha --> 5");
		System.out.println("Crear otro empleado --> 6");
		System.out.println("Salir --> 9");
		eleccion = sc.nextLine();
		Empleado emp;
		ArrayList<Empleado>ArrEmp;
		switch (eleccion) {
		case "1":
			mostrarEmpleados();
			break;
		case "2":
			System.out.println("Introduce un nif");
			nifintro=sc.nextLine();
			emp = ObtnerEmpleadoNif(nifintro);
			mostrarEmpleado(emp);
			break;
		case "3":
			System.out.println("Introduce un nombre");
			nombreintro=sc.nextLine();
			emp = ObtenerEmpleadoNombre(nombreintro);
			mostrarEmpleado(emp);
			break;
		case "4":
			System.out.println("Introduce una fecha");
			fechaintro=sc.nextLine();
			emp = ObtenerEmpleadoFechaContrato(fechaintro);
			mostrarEmpleado(emp);
			break;
		case "5":
			System.out.println("Introduce una fecha para devolver la lista de empleados");
			fechaintro=sc.nextLine();
			ArrEmp = ObetnerListaEmpleadoFechaContrato(fechaintro);
			mostrarListaEmpleadosFecha(ArrEmp);
			break;
		case "6":
			crearEmpleados();
			break;
		case "9":
			System.out.println("Gracias por usar el sistema de gestión de Empleados :-)123456789p");
			break;
		default:
			System.out.println("El valor introducido no es válido.");
			break;
		}
		}while(!eleccion.equals("9"));
	}
 
	public static void crearEmpleados() {
		Empleado emp;
		String nif;
		String nombre;
		String fechaContrato;
		String letra = "";
		do {
			System.out.println("introduzca el nif");
			nif = sc.nextLine();
			System.out.println("Introducza el nombre");
			nombre = sc.nextLine();
			System.out.println("introduzca la fecha de Contrato");
			fechaContrato = sc.nextLine();
			emp = new Empleado(nif, nombre, fechaContrato);
			Empleados.add(emp);
			System.out.println("¿Quiere introducir un nuevo empleado? (Y/N)");
			letra = sc.nextLine();
		} while ((letra.equals("y")) || (letra.equals("Y")));
		mostrarEmpleados();
	}
 
	private static void mostrarEmpleados() {
		System.out.println("Mostrando...");
		for (int i = 0; i < Empleados.size(); i++)
			System.out.println("Nombre = " + Empleados.get(i).getNombre() + " NIF= " + Empleados.get(i).getNIF()
					+ " Fecha= " + Empleados.get(i).getFecha());
	}
 
	private static void mostrarEmpleado(Empleado emp){
			System.out.println("Nombre = " + emp.getNombre() + " NIF= " + emp.getNIF()
					+ " Fecha= " + emp.getFecha());
	}
 
	private static void mostrarListaEmpleadosFecha(ArrayList<Empleado> emp){
		for (int i = 0; i < emp.size(); i++)
			System.out.println("Nombre = " + emp.get(i).getNombre() + " NIF= " + emp.get(i).getNIF()
					+ " Fecha= " + emp.get(i).getFecha());
	}
 
	private static Empleado ObtnerEmpleadoNif(String nif) {
		Empleado empleado = new Empleado();
		for (int i = 0; i < Empleados.size(); i++) {
			if (nif.equals(Empleados.get(i).getNIF())) {
				empleado = Empleados.get(i);
			}
		}
		return empleado;
	}
 
	private static Empleado ObtenerEmpleadoNombre(String nombre) {
		Empleado empleado = new Empleado();
		for (int i = 0; i < Empleados.size(); i++) {
			if (nombre.equals(Empleados.get(i).getNombre())) {
				empleado = Empleados.get(i);
			}
		}
 
		return empleado;
	}
 
	private static Empleado ObtenerEmpleadoFechaContrato(String fechaContrato) {
		Empleado empleado = new Empleado();
		for (int i = 0; i < Empleados.size(); i++) {
			if (fechaContrato.equals(Empleados.get(i).getFecha())) {
				empleado = Empleados.get(i);
			}
		}
		return empleado;
	}
 
	private static ArrayList<Empleado> ObetnerListaEmpleadoFechaContrato(String fechaContrato){
		Empleado empleado = new Empleado();
		ArrayList<Empleado> emp = new ArrayList<Empleado>();
		for (int i = 0; i < Empleados.size(); i++) {
			if (fechaContrato.equals(Empleados.get(i).getFecha())) {
				empleado = Empleados.get(i);
				emp.add(empleado);
			}
		}
		return emp;
 
	}
 
}
