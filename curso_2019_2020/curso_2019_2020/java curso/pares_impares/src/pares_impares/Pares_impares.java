/*PARES E IMPARES.
Haz un programa que pida 10 números al usuario e imprima antes de terminar cuántos
son pares y cuántos impares.*/
package pares_impares;

import java.util.Scanner;
public class Pares_impares {

    
    public static void main(String[] args) {
        Scanner entrada = new Scanner(System.in);
        int num=0,pares=0,impares=0,num2;
        
        System.out.println("Digite un numero: ");
        num2=entrada.nextInt();
        
        while(num<10){
            num++;
            if(num2 %2==0){
                pares++;
            }
            else{
                impares++;;
            }
            System.out.println("Digite un numero: ");
            num2=entrada.nextInt();
        }
        
        System.out.println("El numero total de pares es: "+pares+"El numero total de impares es: "+impares);
    }
    
}
