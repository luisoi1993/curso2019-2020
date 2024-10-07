/*
Realiza un procedimiento denominado estadísticas que pida al usuario 10 valores y
muestre a continuación:
• Cuántos números pares y cuántos impares se han leído.
• Cuántos números eran de 1 cifra, cuántos de 2 y cuántos de más cifras.
• ¿Podrías calcular el valor medio de todos los números? 
 */
package estadisticas;

import java.util.Scanner;
public class Estadisticas {

   
    public static void main(String[] args) {
       Scanner entrada=new Scanner(System.in);
       int num,cont_pares=0,cont_impares=0,cont_1cifra=0,cont_2cifras=0,cont_mcifras=0;
       int media,sum=0,i=0;
       
       System.out.println("Digite un numero positivo: ");
       num=entrada.nextInt();
       
       while(i<10){
           i++;
           sum=num+sum;
           if(num%2==0){
               cont_pares++;
           }
           else{
               cont_impares++;
           }
           if(num<10){
               cont_1cifra++;
               
           }
           else if(num<100){
               cont_2cifras++;
               
           }
           else{
               cont_mcifras++;
           }
           System.out.println("Digite otro numero positivo: ");
           num=entrada.nextInt();
       }
       media=sum/10;
       
       System.out.println("El numero de pares es: "+cont_pares);
       System.out.println("El numero de impares es: "+cont_impares);
       System.out.println("El numero de numeros con una cifra es: "+cont_1cifra);
       System.out.println("El numero de numeros con dos cifras es: "+cont_2cifras);
       System.out.println("El numero de numeros con mas de dos cifras es: "+cont_mcifras);
       System.out.println("La media es: "+media);
    }
    
}
