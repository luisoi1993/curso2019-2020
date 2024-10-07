/*
 IMPARES
Escribe y prueba un procedimiento que devuelva cuántos números impares hay en el intervalo especificado:
Ejemplo:
impares  1 10
devolverá cuántos números impares tenemos desde el 1 hasta el 10
 */
package impares_intervalo;

import java.util.Scanner;
public class Impares_intervalo {

    
    public static void main(String[] args) {
       Scanner entrada=new Scanner(System.in);
       int cont=0,num,num2;
       
       System.out.println("Digite el principio del intervalo: ");
       num=entrada.nextInt();
       System.out.println("Digite el final del intervalo: ");
       num2=entrada.nextInt();
       
       
       while(num<num2){
           num++;
           
           if(num%2==0){
               
           }
           else{
               cont++;
           }
       }
       
       System.out.println("El numero total de numeros impares es: "+cont);
    }
    
}
