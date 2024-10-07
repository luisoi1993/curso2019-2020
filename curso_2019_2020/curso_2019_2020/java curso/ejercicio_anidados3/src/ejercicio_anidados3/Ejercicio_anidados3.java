/*Realiza un programa en el que darás un valor inicial al número y te imprimirá por pantalla:
(para numero = 6)
     *
    **
   ***
  ****
 *****
******  */
package ejercicio_anidados3;

import java.util.Scanner;
public class Ejercicio_anidados3 {

   
     public static void main(String[] args) {
        Scanner entrada=new Scanner(System.in);
        int num, aux,aux2=0;
        
        System.out.println("Digite un numero: ");
        num=entrada.nextInt();
        aux=num;
        for(int i =1;i<=num;i++){
           for(int s=aux-1;s!=0;s--){
               System.out.print(" ");
           } 
           for(int j=aux2;j>0;j--){ 
              
            System.out.print("*");
          }
          System.out.println();
          aux--;
          aux2++;
      }    
    }
    
}
