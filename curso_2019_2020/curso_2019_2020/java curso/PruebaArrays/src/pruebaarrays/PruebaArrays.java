/*
  
   Ejercicio 1:
      Imprime por pantalla los valores almacenados en el array miniTablero.
	  
   Ejercicio 2: 
       Prueba el bucle for-each en el método modificaSalario. ¿Se modifican los salarios o no?
	   
   Ejercicio 3:
       Añade código para rellenar el array de empleados e imprimir luego los valores almacenados.
	   
   Ejercicio 4: 
       Imprime por pantalla los valores del array cubix.
	   
   Ejercicio 5:
       Haz un programa que pida 15 números por teclado, los guarde en un array e imprima por pantalla
	   los valores impares almacenados en orden inverso al que se leyeron.
	   
   Ejercicio 6:
       Codifica y prueba un método:
	      public static String nombreMes(int numeroMes) {}
	   que recibe un número de mes (entre 1 y 12) y devuelve su nomnbre o "Error" si el número está fuera
	   rango.
	   
   Ejercicio 7: Haz un programa que lea calificaciones (valores enteros de 1 a 10) hasta que el usuario
        introduzca un cero. El programa imprimirá para cada calificación cuántas veces ha aparecido
		y cuál es la calificación más frecuente.
 */
package pruebaarrays;


import java.util.Scanner;








public class PruebaArrays {
	
    public static void main(String [] args) {
        

		String[] nombre = new String[5];
		double[] salario = new double[5]; 
	    int[] edad = new int[5];
		
		if (nombre.length != edad.length) {
			System.out.println("Error: los arrays deberían tener el mismo tamaño!!");
		}
		
		Scanner lector = new Scanner(System.in);
		
		for(int i = 0; i < 5; i++) {
			System.out.print("Nombre[" + i + "]: ");
			nombre[i]=lector.nextLine();
			System.out.print("Edad[" + i + "]: ");
			edad[i]=lector.nextInt();
			System.out.print("Salario[" + i + "]: ");
			salario[i]=lector.nextDouble();
			lector.nextLine(); // elimina salto de línea
			System.out.println();
		}
		
		// Modificamos los salarios: incremento de un 20%
		modificaSalario(salario, 1.2);
		
		// Imprimimos los datos leídos en orden inverso
		for(int i=4; i>=0; i--) {
			System.out.println("Nombre: " + nombre[i] + " Edad: " + edad[i] + " Salario: " + salario[i]);
		}
		
		// También podemos almacenar en un array los objetos de nuestras propias clases
		Empleado[] empleados = new Empleado[5];   
		
		// Nota: observa cómo la orientación objetos nos permite agrupar datos, como los de un empleado,
		//   en una clase. Antes, los datos estaban en arrays separados y era nuestra tarea como programadores
		//   "estar pendientes" de la relación entre cada array. Ahora, cada elemento del array lleva consigo
		//   todos esos datos en la "entidad" Empleado.
		
		// Los arrays pueden ser bidimensionales
		int[][] miniTablero = new int[2][2];
		miniTablero[0][0] = 0;
		miniTablero[0][1] = 1;
		miniTablero[1][0] = 2;
		miniTablero[1][1] = 3;

		// O de más dimensiones:
		int [][][] cubix;   // Ojo!  Solo tenemos la referencia. Todavía no se ha creado un array tridimensional
		
		cubix = new int[3][3][3];
		
		// Una referencia a arrays puede apuntar a otro array:
		cubix = new int[2][4][4]; // Observa que este nuevo array tiene diferentes dimensiones.
		
		// Analiza esto:
		System.out.println("Longitud primera fila: " + cubix[0].length); //
		//Ejercicio 1
                for(int i=0;i<miniTablero.length;i++){
                    
                }
	}
	
	// Los arrays se pueden pasar a otros métodos y los cambios realizados sobre ellos, "perduran" 
	//   (se pasa la referencia al objeto array, NO una copia
	public static void modificaSalario(double[] sueldos, double incPorcentual) {
        for (int i=0; i<sueldos.length; i++) {
			sueldos[i]=sueldos[i]*incPorcentual;
		}
        /*  Podemos recorrer el array con un bucle for-each o for extendido... pero
		    tiene limitaciones: no nos sirve para modificar el contenido del array (con datos primitivos)
			Referencia: https://www.geeksforgeeks.org/for-each-loop-in-java/
		
    	for(double s: sueldos) {
			s = s*incPorcentual;
		}
		*/
	}
}

class Empleado {
	String nombre;
	double salario;
	int edad;
	
	
}