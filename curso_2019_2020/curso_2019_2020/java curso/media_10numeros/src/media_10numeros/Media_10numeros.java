/*MEDIA 10.
Haz un programa que pida 10 números al usuario e imprima su media.

 */
package media_10numeros;

import java.util.Scanner;

public class Media_10numeros {

  
    public static void main(String[] args) {
       Scanner entrada = new Scanner(System.in);
       int contador=0,num,media=0,contador2=0;
       
       System.out.println("Digite un numero: ");
       num=entrada.nextInt();
       
       while(contador<10){
           contador++;
           contador2=contador2+num;
           System.out.println("Digite otro numero: ");
           num=entrada.nextInt();
       }
       
       media=contador2/10;
       System.out.println("La media es: "+media);
       
    }
    
}
