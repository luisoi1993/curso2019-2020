/*Codifica un método denominado esPrimo que calcula si un número es primo o no. Elige el tipo que 
debe devolver. */

package esprimo;

import java.util.Scanner;
public class EsPrimo {

    
    public static void main(String[] args) {
       Scanner entrada=new Scanner(System.in);
       int numero,divisor=2;
       boolean primo=true;
       
       System.out.println("Digite un numero: ");
       numero=entrada.nextInt();
       
     
       
       while(divisor!=numero){
         
           
           if(numero%divisor==0){
               primo=false;
               divisor++;
               break;
           }
           else{
               divisor++;
           }
       }
       if(primo==true){
           System.out.println("El "+numero+" es primo.");
       }
       else{
           System.out.println("El numero no es primo.");
       }
          
    }
    
}
