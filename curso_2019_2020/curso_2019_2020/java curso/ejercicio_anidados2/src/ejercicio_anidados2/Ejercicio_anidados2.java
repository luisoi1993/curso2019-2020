/* Realiza un programa en el que darás un valor inicial al número y te imprimirá por pantalla:
(para numero = 6)
******                                                   
 *****                                                   
  ****                                                   
   ***                                                   
    **                                                   
     * 
 */
package ejercicio_anidados2;

import java.util.Scanner;
public class Ejercicio_anidados2 {

   
    public static void main(String[] args) {
        Scanner entrada=new Scanner(System.in);
        int num, aux=0;
        
        System.out.println("Digite un numero: ");
        num=entrada.nextInt();
        
        for(int i =1;i<=num;i++){
           for(int s=0;s!=aux;s++){
               System.out.print(" ");
           } 
           for(int j=num;j>=i;j--){ 
              
            System.out.print("*");
          }
          System.out.println();
          aux++;
      }    
    }
    
}
