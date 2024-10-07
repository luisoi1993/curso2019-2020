/*Codifica un programa en Java que calcule el factorial de un número n:  n*(n-1)*...2*1
Ejemplo: el factorial de 4 (4!) será:  4*3*2*1 */

package factorial;

import java.util.Scanner;
public class Factorial {

   
    public static void main(String[] args) {
        Scanner entrada=new Scanner(System.in);
        int numero,factorial=1;
        
        System.out.println("Digite un numero: ");
        numero=entrada.nextInt();
        
        while(numero>0){
            factorial=numero*factorial;
            numero--;
        }
      
        System.out.println("El factorial es: "+factorial);
    }
    
}
