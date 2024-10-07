/* SUMADÍGITOS
 Realiza un programa que solicite al usuario dos números enteros y compruebe si la suma
 de los dígitos de cada número es igual o no.
 Por ejemplo: 
    1035  La suma de sus dígitos es 9.  
	117   La suma de sus dígitos también es 9.*/
package sumadigitos;

import java.util.Scanner;
public class SUMADIGITOS {

   
    public static void main(String[] args) {
        Scanner entrada = new Scanner(System.in);
        int numero,numero2,resultado=0,resultado2=0;
        
        System.out.println("Introduce un numero para sumar sus digitos: ");
        numero=entrada.nextInt();
        
        while(numero>0){
            resultado+=numero%10;
            numero=numero/10;
            
        }
        System.out.println("Introduce otro numero para sumar sus digitos: ");
        numero2=entrada.nextInt();
        
        while(numero2>0){
            resultado2=resultado2+numero2%10;
            numero2=numero2/10;
        }
        
        if(resultado==resultado2){
            System.out.println("La suma de numero 1 del 2 son iguales: ");
        }
        else{
            System.out.println("La suma del numero 1 del numero 2 no son iguales: ");
        }
    }
    
}
