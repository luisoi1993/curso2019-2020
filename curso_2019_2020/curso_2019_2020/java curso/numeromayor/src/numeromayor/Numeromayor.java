/* Codifica un programa en el que tengas dos variables enteras, con los valores 
que elijas. El programa te dirá (utilizando sentencias if-else) qué número es 
mayor o si son iguales. */

package numeromayor;

import java.util.Scanner;

public class Numeromayor {

    
    public static void main(String[] args) {
        Scanner entrada= new Scanner(System.in);
        int num,num2;
        
        System.out.println("Digite un numero: ");
        num=entrada.nextInt();
        
        System.out.println("Digite otro numero: ");
        num2=entrada.nextInt();
        
        if(num>num2){
            System.out.println("El primer numero es mayor.");
        }
        else if(num2>num){
            System.out.println("El segundo numero es mayor.");
        }
        else{
            System.out.println("Los numeros son iguales.");
        }
        
    }
    
}
