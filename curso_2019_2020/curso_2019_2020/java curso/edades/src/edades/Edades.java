/*
EDADES.
Haz un programa que pida un número al usuario (una edad de una persona) y le informe de si es menor de 18 años,
mayor o igual a 65, o tiene entre una edad entre 18 años y menor de 65 años.
 */
package edades;

import java.util.Scanner;
public class Edades {

    
    public static void main(String[] args) {
       Scanner entrada= new Scanner(System.in);
       int num;
       
       System.out.println("Digite un numero: ");
       num=entrada.nextInt();
       
       if(num<18){
           System.out.println("Es menor de 18 años: "+num);
        }
       else if(num>65){
           System.out.println("Tiene mas de 65 años: "+num);
       }
       else{
           System.out.println("Su edad esta entre 18 y 65: ");
       }
           
       
    }
    
}
