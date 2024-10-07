/*

 */
package empleado_2;
import java.time.LocalDate;
import java.util.Scanner;


public class Empleado_2 {
    
    private static final int MAX_EMPLEADOS = 100;
   
    // atributos
    static Empleado[] empleados = new Empleado[MAX_EMPLEADOS];
    static int empleadosActivos = 3;  // número de empleados en la empresa
    Empleado e1= new Empleado("Luis","Aguado Diego","50489576r");
    Empleado e2= new Empleado("Alba","de Vera","50389576r");
    Empleado e3= new Empleado("Jessica","Ospina","51489576r");
    static Scanner lector = new Scanner(System.in);

    static void altaEmpleado() {
        String nombre;
        String apellidos;
        String DNI;
        int numEmpleado;
        double salario;
        Departamento departamento;  
        LocalDate fechaNacimiento;
        LocalDate fechaAlta;
        String direccion;
        String telefono;
        
        System.out.println("DAR DE ALTA EMPLEADO");
        System.out.print("Introduce nombre: ");
        nombre = lector.nextLine();
        System.out.print("Introduce apellidos: ");
        apellidos = lector.nextLine();
        System.out.print("Introduce DNI(con letra,sin guion): ");
        DNI = lector.nextLine();    
        System.out.print("Introduce salario bruto anual: ");
        salario = lector.nextDouble();
        lector.nextLine();  // limpia buffer

        departamento = introduceDepartamento();
        fechaNacimiento = introduceFecha("Introducir fecha de nacimiento.");
        fechaAlta = LocalDate.now();
        
        lector.nextLine();
        System.out.print("Direccion: ");
        direccion = lector.nextLine();
        System.out.print("Telefono: ");
        telefono = lector.nextLine(); 
        
        Empleado e = new Empleado(DNI, nombre, apellidos);
        e.setSalario(salario);
        e.setDepartamento(departamento);  
        e.setFechaNacimiento(fechaNacimiento);
        e.setFechaAlta(fechaAlta);
        e.setDireccion(direccion);
        e.setTelefono(telefono);
        
        empleados[empleadosActivos] = e;  // almacenamos empleado en el array
        empleadosActivos++;
    }
    static LocalDate introduceFecha(String mensaje) {
        System.out.println(mensaje);
        System.out.print("Anio: ");
        int anio = lector.nextInt();
        System.out.print("Mes (1-12): ");
        int mes = lector.nextInt();
        System.out.print("Dia (1-31): ");
        int dia = lector.nextInt();
        LocalDate fechaNacimiento = LocalDate.of(anio, mes, dia);
        return fechaNacimiento;
    }
    
    static void listarEmpleados() {
        // utilizaremos (temporalmente el método toString de Empleado
        System.out.println("LISTADO DE EMPLEADOS");
        for(int i = 0; i < empleadosActivos; i++ ) {
            System.out.println(empleados[i]); // se invoca el método toString
            System.out.print("Intro para continuar:");
            lector.nextLine();
        }
    }
    static Departamento introduceDepartamento() {
        boolean terminado;
        Departamento departamento = Departamento.INFORMATICA;
        do {
            terminado = true;
            System.out.print("Departamento (1.INF. 2. VENTAS. 3. ADMIN: )");
            int dpto = lector.nextInt();
            switch(dpto) {
                case 1: 
                    departamento = Departamento.INFORMATICA;
                    break;
                case 2: 
                    departamento = Departamento.VENTAS;
                    break;   
                case 3: 
                    departamento = Departamento.ADMINISTRACION;
                    break;

                default:
                    terminado = false;
                    System.out.println("Error. Opcion incorrecta.");
            }
        } while(terminado != true);
        
        return departamento;
    }

    static void menu() {
        int opcion;
        do {
            System.out.println("\nAPLICACION GESTION EMPLEADOS\n");
            System.out.println("1. Dar de alta empleado.");
            System.out.println("2. Listar empleados.");
            System.out.println("3.Borrar empleado. ");
            System.out.println("10. Salir de la aplicacion.");
            
            System.out.print("\nElige opción: ");
            opcion = lector.nextInt();
            lector.nextLine(); // limpia el buffer de entrada
            switch(opcion) {
                case 1:
                    altaEmpleado();
                    break;
                case 2:
                     listarEmpleados();
                     break;
                case 3:
                    borrarEmpleado();
                    break;
                case 10:
                    // confirmar salida de la app
                    System.out.print("Realmente desea salir (S/N): ");
                    String confirmacion = lector.nextLine().toLowerCase();
                    if (confirmacion.equals("n")) {
                        opcion = 0; // no salir
                    }
                    break;
                default: 
                   System.out.println("Opcion no valida. Pulse Intro para continuar"); 
                   lector.nextLine();
                    
            }
        } while(opcion != 10);
        
    }
     static void borrarEmpleado() {
         Scanner entrada=new Scanner(System.in);
         int num;
         System.out.println("Digite el numero de empleado que quiere borrar: ");
         num=entrada.nextInt();
         e(num)=null;
    }
    
   
    public static void main(String[] args) {
        
        menu();
    }
    
}

