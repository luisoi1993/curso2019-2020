/* Ejercicio anidados04: 	 
Realiza un programa en el que darás un valor inicial al número y te imprimirá por pantalla:
(para numero = 7)

      1                                                  
     212                                                 
    32123                                                
   4321234                                               
  543212345                                              
 65432123456                                             
7654321234567 
 */
package ejercicio_anidados4;

public class Ejercicio_anidados4 {
	
	public static void main(String[] args) {
		
		// vamos a generar un número aleatorio entre 1 y 9 (en varios pasos)
		double inicial = Math.random();   // número entre 0 y 1 (no incluido el 1) 0 <= num < 1 
		inicial = (inicial * 9) + 1;     // número con decimales (parte entera va desde 1 hasta 9)
		int num = (int) inicial;          // casting: conversión explícita a entero
		
		/* anidados04 */
		System.out.println();
		for (int i = 1; i<= num; i++) { // bucle "externo"
		    // imprimir espacios
			for(int j = 1; j <= (num - i); j++)  { 
		        System.out.print(" ");
			}
		    // imprimir espacios '..321'
			for(int j = i; j >= 1; j--)  { 
		        System.out.print(j);
			}
			// imprimir espacios '23..'
			for(int j = 2; j <= i; j++)  { 
		        System.out.print(j);
			}
			System.out.println();
		}
	}
}