/*
   GESTIÓN DE EMPLEADOS: 
     paso 5 implementado (falta realizar más pruebas y mejorar la interacción
           con el usuario)
 */
package gestionempleados;
import java.time.LocalDate;
import java.util.Scanner;

/**
 *
 * @author chema
 * 
 */
public class GestionEmpleados {
    
    private static final int MAX_EMPLEADOS = 100;
    
    // atributos
    static Empleado[] empleados = new Empleado[MAX_EMPLEADOS];
    static int empleadosActivos = 0;  // número de empleados en la empresa
    
    static Scanner lector = new Scanner(System.in);

    static void altaEmpleado() {
        if (empleadosActivos < MAX_EMPLEADOS) { // hay espacio para dar de alta
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
        else {
            System.out.println("Capacidad maxima del sistema alcanzada."
                    + " No se puede dar de alta nuevos empleados.");
        }
    }
    
    
    static void rellenaEmpleados() {
        // introduce empleados en el array para realización de pruebas.
        
        // primer empleado
        Empleado e = new Empleado("2134234A", "Ana", "Valle Lopez");
        e.setSalario(25000);
        e.setDepartamento(Departamento.VENTAS);  
        e.setFechaNacimiento( LocalDate.of(1990, 12, 2 ));
        e.setFechaAlta(LocalDate.now());
        e.setDireccion("Valeras 20, Aranjuez");
        e.setTelefono("695.95.95");
        empleados[empleadosActivos] = e;  // almacenamos empleado en el array
        empleadosActivos++;
        
        // segundo empleado
        e = new Empleado("324534525H", "John", "LeCarre");
        e.setSalario(40000.55);
        e.setDepartamento(Departamento.ADMINISTRACION);  
        e.setFechaNacimiento( LocalDate.of(1950, 11, 2 ));
        e.setFechaAlta(LocalDate.now());
        e.setDireccion("Alcala 155, Madrid");
        e.setTelefono("+34 698.98.98");
        empleados[empleadosActivos] = e;  // almacenamos empleado en el array
        empleadosActivos++;
        
        // tercer empleado
        e = new Empleado("4352345L", "Isabel", "Perez Batllo");
        e.setSalario(42000.249);
        e.setDepartamento(Departamento.ADMINISTRACION);  
        e.setFechaNacimiento( LocalDate.of(1975, 4, 11 ));
        e.setFechaAlta(LocalDate.now());
        e.setDireccion("Gran Via 55, Madrid");
        e.setTelefono("+34 691.91.91");
        empleados[empleadosActivos] = e;  // almacenamos empleado en el array
        empleadosActivos++;
    }
    
    static void bajaEmpleado() {
        int index;
        System.out.println("BAJA DE EMPLEADO");
        System.out.print("Introduce el numero de empleado (0, SALIR):");
        int nEmp = lector.nextInt();
        boolean encontrado = false;
        for(index=0; index < empleadosActivos && !encontrado; index++) {
            if ( (empleados[index].numEmpleado) == nEmp) {
                encontrado = true;
                break;  // si no, se incrementa el index... (error en versión anterio)
            }
        }
        if (encontrado) {
            // Ejercicio: mostrar el empleado y pedir confirmación
            
            // borramos empleado
            empleados[index] = null;
            compactarArray(index);
            empleadosActivos--;
            
            System.out.print("Empleado borrado. ");
            
        } 
        else {
            System.out.print("No se ha encontrado el empleado solicitado. ");
        }
        System.out.print("Pulse Intro para continuar...");
        lector.nextLine();      
    }
    
    // mueve los empleados una posición a la izquierda a partir del índice dado
    static void compactarArray(int index) {
        while(empleados[index+1] != null) {
            empleados[index] = empleados[index+1];
            index++;
        }
        empleados[index+1] = null; // 
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

    static void listarEmpleados(Empleado[] e) {
        System.out.printf("%-5s%-15s%-25s%-10s%12s%n", 
                  "NUM", "NOMBRE", "APELLIDOS", "DNI", "SALARIO");
        for(int i=0; i <empleadosActivos; i++) {
            char dniCheck = dniCorrecto(e[i].DNI) ? ' ':'*';
            System.out.printf("%-5s%-15s%-25s%-10s%2c%12.2f%n",
                       e[i].numEmpleado,
                       e[i].nombre,
                       e[i].apellidos,
                       e[i].DNI,dniCheck,
                       e[i].salario);
                       
        }
    }
    
    // busca por número de empleado. Devuelve posición en el array. 
    //      o -1 si no se encuentra.
    static int buscaEmpleado(int numEmp) {
        boolean encontrado = false;
        int index;
        for(index=0; index < empleadosActivos && !encontrado; index++) {
            if ( (empleados[index].numEmpleado) == numEmp) {
                encontrado = true;
                break; 
            }
        }
        if (!encontrado) {
            index = -1;
        }
        return index;
    }
    static void muestraEmpleado() {
        int index;
        System.out.println("INFORMACION SOBRE UN EMPLEADO");
        System.out.print("Introduce el numero de empleado (0, SALIR):");
        int nEmp = lector.nextInt();
        
        index = buscaEmpleado(nEmp);
        if (index != -1) {
            System.out.println(empleados[index]);            
        } 
        else {
            System.out.print("No se ha encontrado el empleado solicitado. ");
        }
        System.out.print("Pulse Intro para continuar...");
        lector.nextLine();      
    }
    
    static void modificaSalarioEmpleado() {
        int index;
        System.out.println("MODIFICACION SALARIO DE UN EMPLEADO");
        System.out.print("Introduce el numero de empleado (0, SALIR):");
        int nEmp = lector.nextInt();
        
        index = buscaEmpleado(nEmp);
        if (index != -1) {
            System.out.println("Empleado: " + empleados[index].nombre +
                                 " "   + empleados[index].apellidos +
                                 ": "  + empleados[index].salario); 
            System.out.print("Nuevo salario: ");
            empleados[index].salario = lector.nextDouble();
            System.out.print("Salario actualizado. ");
        } 
        else {
            System.out.print("No se ha encontrado el empleado solicitado. ");
        }
        System.out.print("Pulse Intro para continuar...");
        lector.nextLine();      
    }
    static void modificaSalarios() {
        System.out.println("MODIFICACION DE TODOS LOS SALARIOS");
        System.out.print("Introduce el porcentaje (positivo o negativo) - 0 para SALIR:");
        double porcentaje = lector.nextDouble();
        if (porcentaje != 0.0) {
            for (int i = 0; i < empleadosActivos; i++) {
                empleados[i].salario = empleados[i].salario*(1 + porcentaje/100.0);           
            }
            System.out.println("Salarios actualizados. ");
        }       
    }
    
    static void estadisticasSalarios() {
        System.out.println("ESTADISTICAS SALARIALES");
        System.out.println("Empleados activos: " + empleadosActivos);
        double sumaSalarios = 0;
        if (empleadosActivos > 0) {
            double maxSalario = 0;
            double minSalario  = empleados[0].salario;
            for (int i = 0; i < empleadosActivos; i++) {
                sumaSalarios = sumaSalarios + empleados[i].salario;
                if (empleados[i].salario > maxSalario) {
                     maxSalario = empleados[i].salario;
                }
                if (empleados[i].salario < minSalario) {
                    minSalario = empleados[i].salario;
                }
                
            }   
            System.out.printf("Total salarios  : %10.2f%n", sumaSalarios);
            System.out.printf("Salario medio   : %10.2f%n" , sumaSalarios/empleadosActivos);
            System.out.printf("Salario mas alto: %10.2f%n" , maxSalario);
            System.out.printf("Salario mas bajo: %10.2f%n" , minSalario);
        }
        else {
            System.out.println("No hay empleados actualmente en el sistema.");
        }
    }
    
    static void ordenarArrayApellidosNombre(Empleado[] array) {
        Empleado aux;
        boolean ordenado = false;  // para averiguar si el array está ya ordenado y parar
        for(int i=0; i < empleadosActivos - 1 && ordenado==false; i++) {
                ordenado = true;

                for(int j=0; j < empleadosActivos - 1 -i; j++) {
                    int comparacion = array[j].apellidos.compareTo(array[j+1].apellidos);
                    if( comparacion>0 || (comparacion==0 && array[j].nombre.compareTo(array[j+1].nombre)>0)) {
                        aux = array[j];
                        array[j] = array[j+1];
                        array[j+1] = aux;
                        ordenado = false; // se ha realizado un cambio en esta iteración
                    }
                }
        }
        
    }
    static void listarEmpleadosOrdenadosApellidosNombre() {
        Empleado[] array = new Empleado[empleadosActivos];
        System.arraycopy(empleados, 0, array, 0, empleadosActivos);
        ordenarArrayApellidosNombre(array);
        listarEmpleados(array);        
    }
    
    // asume letra en última posición cadena
    static boolean dniCorrecto(String dni) {
        char[] letras = {'T','R','W','A','G','M','Y','F','P','D','X','B',
            'N','J','Z','S','Q','V','H','L','C','K','E'};
        int num = Integer.valueOf(dni.substring(0, dni.length()-1));
        int resto = num%23;
        char letra = letras[resto];
        if (letra == Character.toUpperCase(dni.charAt(dni.length()-1))) {
            return true;
        }
        return false;

    }
    
    static void menu() {
        int opcion;
        do {
            System.out.println("\nAPLICACION GESTION EMPLEADOS\n");
            System.out.println("1. Dar de alta empleado.");
            System.out.println("2. Listar empleados por apellidos y nombre.");
            System.out.println("3. Dar de baja empleado.");
            System.out.println("4. Listar empleados por num. empleado.");
            System.out.println("5. Informacion completa empleado.");
            System.out.println("6. Modificar salario de un empleado.");
            System.out.println("7. Modificación global de salarios.");
            System.out.println("8. Estadisticas de salarios.");
            //System.out.println("9. ");
            System.out.println("10. Salir de la aplicacion.");
            
            System.out.print("\nElige opción: ");
            opcion = lector.nextInt();
            lector.nextLine(); // limpia el buffer de entrada
            switch(opcion) {
                case 1:
                    altaEmpleado();
                    break;
                case 2:
                    listarEmpleadosOrdenadosApellidosNombre();
                     break;
                case 3:
                    bajaEmpleado();
                    break;
                case 4:
                    listarEmpleados(empleados);
                    break;
                case 5: 
                    muestraEmpleado();
                    break;
                case 6: 
                    modificaSalarioEmpleado();
                    break;
                case 7:
                    modificaSalarios();
                    break;
                case 8:
                    estadisticasSalarios();
                    break;
                        
                case 10:
                    // confirmar salida de la app
                    System.out.print("Realmente desea salir (S/N): ");
                    String confirmacion = lector.nextLine().toLowerCase();
                    if (confirmacion.equals("n")) {
                        opcion = 0; // no salir
                    }
                    break;
                case 99: // rellenar empleados para pruebas
                    rellenaEmpleados();
                    break;
                default: 
                   System.out.println("Opcion no valida. Pulse Intro para continuar"); 
                   lector.nextLine();
                    
            }
        } while(opcion != 10);
        
    }
    
    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        
        menu();
    }
    
}
