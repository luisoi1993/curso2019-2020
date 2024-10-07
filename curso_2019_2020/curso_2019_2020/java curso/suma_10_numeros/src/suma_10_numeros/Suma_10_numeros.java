//Haz un programa que pida 10 numeros e imprima su suma
 
package suma_10_numeros;

import java.util.Scanner;
public class Suma_10_numeros {

   
    public static void main(String[] args) {
        Scanner entrada=new Scanner(System.in);
        
        int num=0, sumador=0,temporal;
        
        while(num<10){
            System.out.println("Digite un numero: ");
            temporal=entrada.nextInt();
            num++;
            sumador=sumador+temporal;
            
        }
        
        System.out.println("El resultado de la suma de los 10 numeros es: "+sumador);
        
            
        
    }
    
}
