/*Realiza un programa que lea números enteros hasta que el usuario
introduzca un número menor que el anterior. */

package pedirnumeros_hastanumeromenor;

import java.util.Scanner;

public class Pedirnumeros_hastanumeromenor {

    
    public static void main(String[] args) {
        Scanner entrada=new Scanner(System.in);
        int num_posterior=1,num_anterior=0;
        
        System.out.println("Digite un numero: ");
        num_posterior=entrada.nextInt();
        
        while(num_anterior<num_posterior){
            num_anterior=num_posterior;
            System.out.println("Digite un numero: ");
            num_posterior=entrada.nextInt();
            
        }
    }
    
}
