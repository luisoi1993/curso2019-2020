/*Modifica el método mensajeError para que reciba un número de error e 
imprima un mensaje en función del número (1-> Error crítico.  2-> Fallo en acceso
a disco. 3 -> Error: memoria insuficiente).Nota: utiliza la estructura switch-case.
 */
package modificacion_error;

import java.util.Scanner;
public class Modificacion_error {

    
    public static void main(String[] args) {
         int numero;
         Scanner entrada=new Scanner(System.in);
         
         System.out.println("Digite un numero: ");
         numero=entrada.nextInt();
         
         switch(numero){
             case 1: System.out.println("1- Error critico");
                 break;
             case 2 : System.out.println("2-> Fallo en acceso a disco. ");
                 break;
             case 3: System.out.println("3 -> Error: memoria insuficiente");
                 break;
                
  }
  
    }
    
}
