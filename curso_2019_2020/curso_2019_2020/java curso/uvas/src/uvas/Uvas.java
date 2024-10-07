
package uvas;

import java.util.Scanner;
public class Uvas {

   
    public static void main(String[] args) {
       Scanner entrada=new Scanner(System.in);
       int numero,personas;
       
       System.out.println("Digite el numero de uvas: ");
       numero=entrada.nextInt();
       personas=numero/12;
       
       if(numero%12==0){
           personas=personas+1;
       }
       System.out.println(personas);
       
    }
    
}
