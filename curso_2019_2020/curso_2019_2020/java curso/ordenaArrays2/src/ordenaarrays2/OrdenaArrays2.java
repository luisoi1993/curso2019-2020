/*
 Ejercicio 1:
      Mejora las pruebas que realizamos para la búsqueda binaria: rellena un array de 10000 enteros
	  con valores consecutivos(0, 2, 4...) y realiza búsquedas. 
	  Añade código para que el método busquedaBinaria te muestre información: cuántas comparaciones 
	  realiza hasta encontrar el número buscado o determinar que no está.
	  
   Ejercicio 2:
      Vamos a variar el tamaño del array ordenado sobre el que realizamos pruebas. Haz que el programa
	  pida al usuario el tamaño del array y continuación lo rellene con números en secuencia ordanada.
	  Haz también que se pida al usuario el número que buscamos y realiza pruebas.
	  ¿Cuántas comparaciones se realizan (cuando el número no está, caso peor) para los siguientes tamaños de array:
	    1000, 1000, 10.000, 100.000, 1000.000, 10.000.000
	  ?
	  
   Ejercicio 3:
      Investiga la clase Arrays de Java. Observa que tiene métodos para ordenar y para buscar datos en un array.
	  Realiza un programa que utilice ambos métodos.
 */
package ordenaarrays2;
import java.util.Scanner;

public class OrdenaArrays2 {
	
	// método para imprimir un array de enteros
	public static void imprimeArray(int[] numbers) {
		for(int i: numbers) {
			System.out.print(i + " ");
		}
		System.out.println();
	}
	
	public static void ordenaArraySeleccion(int[] n) {
		int min;
		int pos;
		boolean cambio = false;
		for(int i=0; i < n.length - 1; i++) {
			min = n[i];   //valor mínimo en esta iteración
			pos = i;      // anotamos su posición en el array
			for(int j=i+1; j < n.length; j++) {
				if( min > n[j]) {
					min = n[j];
					pos = j;
					cambio = true;
				}
			}
			if (cambio) {
				n[pos] = n[i];
				n[i] = min;
				cambio = false;
			} 
			
		}
	}
	
	public static void ordenaArrayBurbuja(int[] n) {
        int aux;
		boolean ordenado = false;  // para averiguar si el array está ya ordenado y parar
		for(int i=0; i < n.length - 1 && ordenado==false; i++) {
			ordenado = true;
			for(int j=0; j < n.length - 1 -i; j++) {
				if( n[j] > n[j+1]) {
					aux = n[j];
					n[j] = n[j+1];
					n[j+1] = aux;
					ordenado = false; // se ha realizado un cambio en esta iteración
				}
			}
			
		}
	}
	
	// sobre un array ordenado, nos dice si hay elementos repetidos o no
	public static boolean repetidos(int[]numeros) {
		boolean repetidos = false;
		if (numeros.length > 0) {
		      int anterior = numeros[0];
              for (int i=1; i < numeros.length && !repetidos; i++) {
				  if (numeros[i] == anterior) {
					  repetidos = true;
				  }
				  else {
					  anterior = numeros[i];
				  }
		      }			
		}
		return repetidos;
	}

    public static void main(String [] args) {
        int num=0,contador=0;
        int numeros[]=new int[1000];
        for(int i=0;i<numeros.length;i++){
            numeros[i]=num;
            num=num+2;
        }
        busquedaBinariaNum(numeros,500,contador);
        System.out.println(contador);
    }
	
	// devuelve el índice en el que aparece el número n buscado o -1 si no está en el array.
	public static int busquedaBinariaNum(int[]numeros, int n,int contador) {
            boolean encontrado = false;
            int izquierda = 0;
            int derecha   = numeros.length - 1;
            int centro=-1;
            while (!encontrado && izquierda <= derecha) {
                contador++;
                centro = (izquierda + derecha) / 2;
                if (n < numeros[centro]) {
                derecha = centro - 1;
		 }
                else if (n > numeros[centro]) {
                    izquierda = centro + 1;
		}
                else
                    encontrado = true;
            }
      if (!encontrado) {
		  centro = -1;
	  }
	  return contador;
	}
}