/*
 LEE NÚMEROS.
Codifica un programa que pida números al usuario y termine cuando el usuario introduzca cero.
El programa, antes de terminar mostrará cuántos números ha leído y su valor medio.
 */
package leenumeros;

import java.util.Scanner;

public class Leenumeros {

   
    public static void main(String[] args) {
        Scanner entrada= new Scanner(System.in);
        int num,cont=0,suma=0,media=0;
        
        System.out.println("Digite un numero: ");
        num=entrada.nextInt();
        
        while(num!=0){
            cont++;
            suma=suma+num;
            System.out.println("Digite otro numero: ");
            num=entrada.nextInt();
            
            
        }
        media=suma/cont;
                
        
        System.out.println("El total de numeros: "+cont);
        System.out.println("La media de los numeros es: "+media);

        
    }
    
}
